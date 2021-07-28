import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new,color: Colors.black,),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Form(
        key: _formKey,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Image.asset('assets/Instagram-Logo.png'),
              margin: const EdgeInsets.fromLTRB(90.0,30.0,90.0,5.0),
            ),
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
              margin: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  //filled: true,
                  //fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    //borderSide: BorderSide(
                    //  color: Colors.grey
                    //  )
                  ),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                ),
                obscureText: true,
                controller: _passwordController,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  //filled: true,
                  //fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    //borderSide: BorderSide(
                    //  color: Colors.grey
                    //  )
                  ),
                  labelText: 'Confirm Password',
                  hintText: 'Enter Same Password',
                ),
                obscureText: true,
                validator: (value){
                  if(_passwordController.text != value){
                    return 'Enter same password!';
                  }
                  return null;
                },
                controller: _repeatPwdController,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    if(_formKey.currentState!.validate()){
                      _auth.createUserWithEmailAndPassword(
                          email: _emailController.text, password: _passwordController.text);
                      Navigator.of(context).pushNamed('/second',arguments: 'second');
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Weak password!')));
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Account already exist!')));
                    }
                  }
                },
                child: const Text('Sign up'),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15.0,80.0,15.0,10.0),
                      child: const Divider(
                        color: Colors.grey,
                        //height: 100.0,
                      ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15.0,80.0,15.0,10.0),
                  child: const Text('OR'),
                ),
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15.0,80.0,15.0,10.0),
                      child: const Divider(
                        color: Colors.grey,
                        //height: 50.0,
                      ),
                    )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20.0,20.0,0.0,0.0),
                  child: const Text('Have an account?'),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0.0,20.0,0.0,0.0),
                    child: TextButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed('/second',arguments: 'second page',);
                      },
                      child: const Text('Log in.'),
                    )
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0,65.0,0.0,5.0),
              child: const Divider(
                color: Colors.grey,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(110.0,0.0,0.0,5.0),
              child: const Text('Instagram or Facebook'),
            )
          ],
        ),
      ),
      ),
    );
  }
}