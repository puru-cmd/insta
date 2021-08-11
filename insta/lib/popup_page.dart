import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navbar.dart';


class PopUp extends StatefulWidget {
  const PopUp({Key? key}) : super(key: key);

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  final googleSignIn = GoogleSignIn();

  @override
  void initState() {
    checkIfLoggedIn();
    super.initState();
  }

  void checkIfLoggedIn()async{
    await Firebase.initializeApp();
    SharedPreferences loginData = await SharedPreferences.getInstance();
    bool flag = loginData.getBool('login')??false;

    if(flag){
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyNavBar()));
    }
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    //borderSide: BorderSide(
                    //color: Colors.grey
                    //)
                  ),
                  labelText: 'Username',
                  hintText: 'Enter Your Email Address',
                ),
                controller: _emailController,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: (){
                  handleSignIn();
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void handleSignIn() async {
    final res = await googleSignIn.signIn();
    final auth = await res!.authentication;
    await Firebase.initializeApp();

    SharedPreferences loginData = await SharedPreferences.getInstance();

    AuthCredential credentials = GoogleAuthProvider.credential(
        idToken: auth.idToken ,accessToken: auth.accessToken);

    final user = (await _auth.signInWithCredential(credentials)).user;
    if(user!=null){
      final result = await FirebaseFirestore.instance
          .collection('users').doc(user.uid).get() as dynamic;
      if(result.length == 0){

        FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'id' : user.uid,
          'name' : user.displayName,
          'profile_photo' : user.photoURL,
          'created-at' : DateTime.now().millisecondsSinceEpoch,
        });

        loginData.setString('id', user.uid);
        loginData.setString('name', user.displayName as String);
        loginData.setString('profile_photo', user.photoURL as String);
        loginData.setBool('login', true);

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MyNavBar()));
      }else{
        loginData.setString('id', result[0]['id']);
        loginData.setString('name', result[0]['name']);
        loginData.setString('profile_photo', result[0]['profile_photo']);
        loginData.setBool('login', true);

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyNavBar()));
      }
    }
  }
}
