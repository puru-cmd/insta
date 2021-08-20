import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/second_page.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late SharedPreferences loginData;
  String _username = '';
  String _bio = '';
  String imageUrl = 'https://cdn4.iconfinder.com/data/icons/mayssam/512/add_user-512.png';

  @override
  void initState() {
    initial();
    super.initState();
  }

  void initial()async{
    await Firebase.initializeApp();
    loginData = await SharedPreferences.getInstance();
    setState((){
      _username = loginData.getString('name')!;
      _bio = loginData.getString('bio')!;
      imageUrl = loginData.getString('profileUrl')!;
      print(_bio);
      print(_username);
    });
  }

  @override
  void dispose() {
    // loginData.clear();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: (){},
                icon: const Icon(Icons.lock,size: 15.0,color: Colors.black),
            ),
            /*const DefaultTextStyle(
              style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w500),
              child: Text('cristyan_bohn'),
            ),*/
            SizedBox(
              height: 25,
              width: 135,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  iconSize: 26,
                  elevation: 0,
                  isExpanded: true,
                  hint: Text(_username,style: const TextStyle(color: Colors.black,
                      fontSize: 18,fontWeight: FontWeight.bold),),
                  icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                  items: [
                    DropdownMenuItem(
                      value: 'One',
                        child: TextButton(
                          onPressed: (){
                            loginData.setBool('login',true);
                            Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) =>  const SecondPage()));
                          },
                          child: const Text('Log Out'),
                        ),
                      )
                    ],
                    onChanged: (String? value){
                      setState(() {
                        //_value = value!;
                      });
                    },
                  ) ,
                )//value: _value,
              )
          ],
        ),
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
                        backgroundImage: NetworkImage(imageUrl),
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
                          child: Text(_username,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400,),
                          ),
                        ),
                        // const SizedBox(height: 1),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                          child: Text('$_bio @hfjrk',style: const TextStyle(fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                  ]
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                  child: RaisedButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed('/edit',arguments: 'edit');
                      },
                      child: const Text('Edit Profile',style: TextStyle(fontWeight: FontWeight.w500),),
                    color: Colors.white,
                    elevation: 1.0,
                  ),
                ),
                Builder(),
                /*GridView.count(
                    crossAxisCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    //scrollDirection: Axis.vertical,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    shrinkWrap: true,
                    children: [
                      Container(
                        child: Image.asset('assets/alex.jpg',fit: BoxFit.cover,),
                      ),
                      Container(
                        child: Image.asset('assets/anna.jpg',fit: BoxFit.cover,),
                      ),
                      Container(
                        child: Image.asset('assets/charlotte.jpg',fit: BoxFit.cover,),
                      ),
                      Container(
                        child: Image.asset('assets/damir.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/duong.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/eman.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/jade.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/jessy.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/osmar.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/teddy.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/trarete.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/migaj.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/studio.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/parker.jpg',fit: BoxFit.cover),
                      ),
                    ],
                  ),*/
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


