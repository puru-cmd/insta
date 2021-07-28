import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:untitled/navbar.dart';
import 'popUp_page.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  late SharedPreferences loginData;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    login_status();
  }
  
  void login_status()async{
    loginData = await SharedPreferences.getInstance();
    newUser = (loginData.getBool('login')?? true);
    
    print(newUser);
    if(newUser == false){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (builder) => const MyNavBar()));
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _userNameController.dispose();
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
                    labelText: 'Username',
                    hintText: 'Enter Your Email Address',
                  ),
                  controller: _userNameController,
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
                              children: [
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
                    String _email = _userNameController.text;
                    String _password = _passwordController.text;
                    try{
                      if(_email != '' && _password != '') {
                        loginData.setBool('login', false);
                        loginData.setString('username', _email);
                        await _auth.signInWithEmailAndPassword(
                            email: _email, password: _password);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const MyNavBar()));
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
}