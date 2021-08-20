import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;
class UserPage extends StatefulWidget {
  UserPage({Key? key, required this.userId}) : super(key: key);

  String userId;

  @override
  _UserPageState createState() => _UserPageState(userId);
}

class _UserPageState extends State<UserPage> {
  _UserPageState(String userId);

  String? get userId => null;

  late String id;
  late String name;
  late String bio;
  late String profile;

  @override
  void initState() {
    initial();
    super.initState();
  }

  void initial(){
    _firestore.collection('users')
        .doc(userId).snapshots(includeMetadataChanges: true).listen((event)async{
      id = event.get('id');
      name = event.get('name');
      bio = event.get('bio');
      profile = event.get('profileUrl');

    });
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
        title: Text('_$name'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Container(
                  child: CircleAvatar(
                    radius: 38.0,
                    backgroundImage: NetworkImage(profile),
                    backgroundColor: Colors.white,
                  ),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Colors.amber,
                          Colors.red,
                        ]
                    ),
                  ),
                ),
                Column(
                  children: const [
                    Text('54',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('Posts'),
                  ],
                ),
                Column(
                  children: const [
                    Text('834',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('Followers'),
                  ],
                ),
                Column(
                  children: const [
                    Text('162',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('Following'),
                  ],
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                        child: Text(name,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400,),
                        ),
                      ),
                      // const SizedBox(height: 1),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                        child: Text('$bio @hfjrk',style: const TextStyle(fontWeight: FontWeight.w400)),
                      )
                    ],
                  ),
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                child: RaisedButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed('/edit',arguments: 'edit');
                  },
                  child: const Text('Follow',style: TextStyle(color: Colors.white),),
                  color: Colors.blue,
                  elevation: 0.0,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                child: RaisedButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed('/edit',arguments: 'edit');
                  },
                  child: const Text('Follow',style: TextStyle(color: Colors.black),),
                  color: Colors.white,
                  elevation: 0.0,
                ),
              ),
              ]
            ),
            Builder(),
          ],
        ),
      ),
    );
  }
}

class Builder extends StatelessWidget {
  const Builder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _uid = _auth.currentUser!.uid;

    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('post').where('uid',isEqualTo: _uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData) {
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data!.docs[index];
                  return GridView.count(
                      crossAxisCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      shrinkWrap: true,
                      children: [
                        Container(
                          child: Image.network(doc['image'],fit: BoxFit.cover,),
                        ),
                      ]
                  );
                }
            );
          }
          return const Text('Loading...');
        }
    );
  }
}

