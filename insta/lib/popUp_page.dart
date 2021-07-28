import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class PopUp extends StatefulWidget {
  const PopUp({Key? key}) : super(key: key);

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _auth = FirebaseAuth.instance;

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
                onPressed: () async {
                  return await _auth.sendSignInLinkToEmail(
                    email: _emailController.text,
                    actionCodeSettings: ActionCodeSettings(
                      url: 'https://purushottam.page.link/dynamiclink',
                      handleCodeInApp: true,
                      //iOSBundleId:
                      androidPackageName: 'com.example.insta',
                      androidInstallApp: true,
                      androidMinimumVersion: '8',
                    ),
                  );
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
