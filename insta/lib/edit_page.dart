import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;
class EditProfile extends StatefulWidget {
   const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _bioController = TextEditingController();
  final _nameController = TextEditingController();

  final _formKey = GlobalKey();
  late SharedPreferences loginData;
  String _username = '';
  String _bio = '';
  String imageUrl = 'https://cdn4.iconfinder.com/data/icons/mayssam/512/add_user-512.png';

  final ImagePicker _picker = ImagePicker();
   late PickedFile _imageFile;
   bool isSelected = false;
  final _uid = _auth.currentUser!.uid;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial()async{
    await Firebase.initializeApp();
    loginData = await SharedPreferences.getInstance();
    setState(() {
      _username = loginData.getString('name')!;
      _bio = loginData.getString('bio')!;
      imageUrl = loginData.getString('profileUrl')!;
      print(imageUrl);
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;

    var file = File(_imageFile.path);

    if(permissionStatus.isGranted){

      var snapshot =  FirebaseStorage.instance.ref()
          .child('image/profile/$_uid').putFile(file);

      var downloadUrl = await (await snapshot).ref.getDownloadURL();
      setState(() {
        imageUrl = downloadUrl;
      });
    }else{
      print('No Image Path Received OR Permission not granted. Try Again with permission access');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    // loginData.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.clear_outlined,color: Colors.black,)
        ),
        title: const Text('Edit Profile',style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
            onPressed: () async {
              if(_username != _nameController.text || _bio != _bioController.text) {
                await Firebase.initializeApp();

                _firestore.collection('users').doc(_uid).set(
                    {
                      'name': _nameController.text,
                      'bio': _bioController.text,
                    },
                    SetOptions(merge: true)).then((_) async {
                  print('success!');
                  await loginData.setString('name', _nameController.text);
                  await loginData.setString('bio', _bioController.text);
                });
              }
              if(isSelected ==  true){
                await Firebase.initializeApp();
                await uploadImageToFirebase(context);
                _firestore.collection('users').doc(_uid).set(
                  {
                    'profileUrl' : imageUrl,
                  },
                  SetOptions(merge: true)).then((_) async {
                  await loginData.setString('profileUrl', imageUrl);
                  print('success!');
                });
              }
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.check_outlined,color:Colors.blue),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // StreamBuilder(
            //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
            //
            //   },
            // ),
                children: [
                  ProfilePhoto(),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                        // initialValue: _username,
                        controller: _nameController..text = _username,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Bio',
                        ),
                        //initialValue: _username,
                        controller: _bioController..text = _bio,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 0.0),
                      child: TextButton(
                          onPressed: () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                    content: Stack(
                                      overflow: Overflow.visible,
                                      alignment: Alignment.center,
                                      children: const [
                                        ChangePassword(),
                                      ],
                                  ),
                                );
                              }
                          );
                        },
                        child: const Text('Change Password',
                          style: TextStyle(color: Colors.blue,fontSize: 18.0),)
                    ),
                  ),
            ]
          ),
        ),
      ),
    );
  }


  Widget ProfilePhoto () {
    return Stack(
      //margin: const EdgeInsets.all(2.0),
      //   padding: const  EdgeInsets.all(3.0),
        children: <Widget>[
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) => BottomSheet(),);
            },
            child: Column(
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    foregroundImage: isSelected?
                    FileImage(File(_imageFile.path)):null,
                    backgroundImage: isSelected?null:NetworkImage(imageUrl,scale: 0.3),
                    backgroundColor: Colors.transparent,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                      child: const Text(
                        'Change Profile Photo',
                        style: TextStyle(color: Colors.blue,
                            fontSize: 18.0,fontWeight:FontWeight.w500 ),)
                  ),
                ]
            ),
          )
        ]
    );
  }

  Widget BottomSheet(){
    return Container(
      height: 170.0,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text('Choose Photo/Video to Post',
            style: TextStyle(fontWeight: FontWeight.w500),),
          const Divider(
            color: Colors.grey,
          ),
          TextButton.icon(
            onPressed: (){
              TakePhoto(ImageSource.camera);
            },
            icon: const Icon(Icons.camera_alt),
            label: const Text('Camera',style: TextStyle(color: Colors.blue),),
          ),
          TextButton.icon(
            onPressed: (){
              TakePhoto(ImageSource.gallery);
            },
            icon: const Icon(Icons.photo_library),
            label: const Text('Gallery',style: TextStyle(color: Colors.blue),),
          ),
        ],

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












//change password
class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  final _formKey = GlobalKey();

  @override
  void dispose() {
    _passwordController.dispose();
    _newPasswordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        // title: const Text('Change Password',style: TextStyle(color: Colors.black),),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextFormField(
                //keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Current  Password',
                ),
                controller: _passwordController,
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextFormField(
                //keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'New Password',
                ),
                obscureText: true,
                controller: _newPasswordController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextFormField(
                //keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Confirm Password',
                ),
                controller: _repeatPasswordController,
                obscureText: true,
                validator: (value){
                  if(_newPasswordController.text != value){
                    return 'Password doesn\'t match';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 30.0, 5.0, 0.0),
              child: ElevatedButton(
                onPressed: () async{
                  dynamic user = _auth.currentUser;
                  var _email = user.email;
                  try{
                      await _auth.signInWithEmailAndPassword(
                          email: _email, password: _passwordController.text);
                      user.updatePassword(_newPasswordController.text).then(() {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Password Changed Successfully!')));
                        Navigator.of(context).pop();
                      });
                  }on FirebaseAuthException catch (e){
                    if(e.code == 'wrong-password'){
                      print('Wrong Current Password!');
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Wrong Current Password provided for the user.')));
                    }
                  }
                },
                child: const Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  minimumSize: const Size(150, 50),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

