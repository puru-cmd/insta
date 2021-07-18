import 'package:flutter/material.dart';


class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
      body: SingleChildScrollView(
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
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    //borderSide: BorderSide(
                    //color: Colors.grey
                    //)
                  ),
                  labelText: 'Username',
                  hintText: 'Enter Your Name',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 15.0),
              child: const TextField(
                decoration: InputDecoration(
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
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(225.0, 0.0, 5.0, 0.0),
              child: TextButton(
                onPressed: (){},
                child: const Text('Forgot password?'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed('/home',arguments: 'home');
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
    );
  }
}