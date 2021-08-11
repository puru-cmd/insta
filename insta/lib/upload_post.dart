import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'navbar.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;
class UploadPost extends StatefulWidget {
  const UploadPost({Key? key}) : super(key: key);

  @override
  _UploadPostState createState() => _UploadPostState();
}

class _UploadPostState extends State<UploadPost>{

  late SharedPreferences loginData;
  String profile = '';
  String name = '';

  @override
  void initState() {
    initial();
    super.initState();
  }

  void initial()async{
    await Firebase.initializeApp();
    loginData = await SharedPreferences.getInstance();
    setState(() {
      name = loginData.getString('name')!;
      profile = loginData.getString('profileUrl')!;
      print(imageUrl);
    });
  }

  final _descriptionController  = TextEditingController();
  final _locationController = TextEditingController();
  bool isSelected = false;

  final ImagePicker _picker = ImagePicker();
  late PickedFile _imageFile;
  String imageUrl = '';

  final _uid = _auth.currentUser!.uid;
  var uuid = const Uuid().v1();

  Future uploadImageToFirebase(BuildContext context) async {

    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;

    var file = File(_imageFile.path);

    if(permissionStatus.isGranted){

      var snapshot =  FirebaseStorage.instance.ref()
          .child('image/post/$_uid/$uuid').putFile(file);

      var downloadUrl = await (await snapshot).ref.getDownloadURL();
      setState(() {
        imageUrl = downloadUrl;
      });
    }else{
      print('No Image Path Received OR Permission not granted. Try Again with permission access');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text('New_Post',style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
              onPressed: () async {
                if(isSelected ==  true){
                  await Firebase.initializeApp();
                  await uploadImageToFirebase(context);
                  _firestore.collection('post').doc(uuid).set(
                  {
                    'image' : imageUrl,
                    'name' : name,
                    'profile' : profile,
                    'likes' : {},
                    'description' : _descriptionController.text,
                    'location' : _locationController.text,
                    'uid' : _uid,
                    'postId' : uuid,
                    'time' : DateTime.now(),
                  },
                  SetOptions(merge: true)).then((_) async {
                    print('success!');
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MyNavBar()));
                  });
                }
              },
              icon: const Icon(Icons.check,color: Colors.blue,),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 0.0),
              child: isSelected ==false
                  ? const Text('Yet, not selected any image!'
                      ,style: TextStyle(color: Colors.red),)
                  : Container(
                      height: 200,
                      child: Image(image: FileImage(File(_imageFile.path)),)
                  )
            ),
            Container(
              margin: const EdgeInsets.only(top: 40.0),
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Describe about Photo',
                ),
                // initialValue: _username,
                controller: _descriptionController,
              ),
            ),
            Container(
              // margin: const EdgeInsets.only(top: 40.0),
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
                // initialValue: _username,
                controller: _locationController,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: const EdgeInsets.only(left: 220,),
          child: Row(
            children: [
              TextButton.icon(
                  onPressed: (){
                    TakePhoto(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.photo_library,color: Colors.blue,),
                  label: const Text('Gallery'),
              ),
              TextButton.icon(
                  onPressed: (){
                    TakePhoto(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera_alt,color: Colors.blue,),
                  label: const Text('Camera'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void TakePhoto(ImageSource source)async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile!;
      isSelected = true;
    });
  }
}

class Builder extends StatelessWidget {
  const Builder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool _pressed = false;
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('posts').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document){
                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 10.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage: NetworkImage(data['profile']),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(data['name']),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 0.0),
                        child: Image.network(data['image']),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: _pressed?Image.asset('assets/red_heart.png'):Image.asset('assets/heart.png'),
                              onPressed: (){
                                  _pressed = !_pressed;
                                final snackbar = SnackBar(
                                  content: const Text('You have liked post'),
                                  duration: const Duration(seconds: 2),
                                  action: SnackBarAction(
                                    textColor: Colors.amber,
                                    label: 'Undo',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(snackbar);
                              },
                              iconSize: 30.0,
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Image.asset('assets/comment.png'),
                              iconSize: 30.0,
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Image.asset('assets/message.png'),
                              iconSize: 30.0,
                            ),
                          ],
                        ),
                      ),
                      Text(
                          'Liked  ${data['likes']}'
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 18.0),
                        child: Text(data['description']),
                      ),
                    ],
                  );;
              }).toList(),
            );
          }else if(snapshot.hasError){
            return const Text('It\' Error');
          }
          return Text('');
        }
    );
  }
}


