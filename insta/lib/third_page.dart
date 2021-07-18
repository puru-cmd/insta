import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
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
              margin: const EdgeInsets.fromLTRB(90.0,30.0,90.0,5.0),
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
                  labelText: 'Confirm Password',
                  hintText: 'Enter Same Password',
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
              margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed('/home',arguments: 'home');
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
    );
  }
}