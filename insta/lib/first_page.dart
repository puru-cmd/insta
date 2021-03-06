import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';


//FirebaseAuth _auth = FirebaseAuth.instance;
class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  State<FirstPage> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  //int _counter = 0;

  /*void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
     // _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //appBar: AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      //title: Text(widget.title),
      //),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Image.asset('assets/Instagram-Logo.png'),
              margin: const EdgeInsets.fromLTRB(90.0,150.0,90.0,100.0),
            ),
            Container(
              child: ElevatedButton(
                onPressed: (){
                  //print(_auth.currentUser!.uid);
                  Navigator.of(context).pushNamed('/second',arguments: 'second',);
                },

                child: const Text('Log in'),
              ),
              margin: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 30.0),
            ),
            Container(
              child: FlatButton(
                onPressed: (){
                  Navigator.of(context).pushNamed('/third',arguments: 'third page',);
                },
                child: const Text('Sign Up'),
                textColor: Colors.blue,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue),
                ),
              ),
              margin: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 30.0),
            ),
            /*const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),*/
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}