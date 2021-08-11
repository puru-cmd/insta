import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:untitled/navbar.dart';
import 'popup_page.dart';

FirebaseAuth _auth =  FirebaseAuth.instance;

class SecondPage extends StatefulWidget {

  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    login_status();
    super.initState();
  }

  void login_status()async{
    SharedPreferences loginData = await SharedPreferences.getInstance();
    bool flag = loginData.getBool('login')?? true;

    print(flag);
    if(flag == false){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (builder) => const MyNavBar()));
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
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
                margin: const EdgeInsets.fromLTRB(90.0,90.0,90.0,5.0),
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
                    labelText: 'Email Address',
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
                margin: const EdgeInsets.fromLTRB(225.0, 0.0, 5.0, 0.0),
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
                                 PopUp(),
                              ],
                            ),
                          );
                        }
                    );
                  },
                  child: const Text('Forgot password?'),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
                child: ElevatedButton(
                  onPressed: () async {
                    try{
                      if(_emailController.text != '' && _passwordController.text != '') {
                        handleSignIn();
                      }
                    }on FirebaseAuthException catch (e){
                      if(e.code == 'user-not-found'){
                        print('user not found!');
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('No user found for that email.')));
                      }
                      else if(e.code == 'wrong-password'){
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Wrong password provided for that user.')));
                        print('Wrong password!');
                      }
                    }
                  },
                  child: const Text('Log in'),
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
                    child: const Text('Don\'t have an account?'),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(0.0,20.0,0.0,0.0),
                      child: TextButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed('/third',arguments: 'third page');
                        },
                        child: const Text('Sign up.'),
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
                margin: const EdgeInsets.fromLTRB(100.0,0.0,0.0,10.0),
                child: const Text('Instagram or Facebook'),
              )
            ],
          ),
        ),
      ),
    );
  }
  void handleSignIn()async{
    await Firebase.initializeApp();
    SharedPreferences loginData = await SharedPreferences.getInstance();
    final _user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text)).user;

    // if(_user!=null) {
      FirebaseFirestore.instance.collection('users')
          .doc(_user!.uid).snapshots(includeMetadataChanges: true).listen((event)async{
            await loginData.setString('id', event.get('id'));
            await loginData.setString('name', event.get('name'));
            await loginData.setString('bio', event.get('bio'));
            await loginData.setString('profileUrl', event.get('profileUrl'));
            await  loginData.setBool('login', false);
          });

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const MyNavBar()));
    // }
  }
}
