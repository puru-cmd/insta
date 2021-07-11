import 'package:flutter/material.dart';
import 'package:untitled/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

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
  State<FirstPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FirstPage> {
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
                  Navigator.of(context).pushNamed('/second',arguments: 'second page',);
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
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Image.asset('assets/Instagram-Logo.png'),
              margin: const EdgeInsets.fromLTRB(90.0,90.0,90.0,5.0),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
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
              margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
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
              margin: const EdgeInsets.fromLTRB(255.0, 0.0, 5.0, 0.0),
              child: TextButton(
                onPressed: (){},
                child: const Text('Forgot password?'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
              child: ElevatedButton(
                onPressed: (){},
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
                      child: Divider(
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
              margin: const EdgeInsets.fromLTRB(0.0,65.0,0.0,20.0),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(120.0,0.0,0.0,0.0),
              child: const Text('Instagram or Facebook'),
            )
          ],
        ),
      ),
    );
  }
}


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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Image.asset('assets/Instagram-Logo.png'),
              margin: const EdgeInsets.fromLTRB(90.0,30.0,90.0,5.0),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
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
              margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
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
              margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
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
                      child: Divider(
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
              margin: const EdgeInsets.fromLTRB(0.0,65.0,0.0,20.0),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(120.0,0.0,0.0,0.0),
              child: const Text('Instagram or Facebook'),
            )
          ],
        ),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.camera_alt_outlined,color: Colors.black,),
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
        title: IconButton(
          onPressed: (){},
          icon: Image.asset('assets/Instagram-Logo.png'),
          iconSize: 120.0,
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.live_tv),
            color: Colors.black,
          ),
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.near_me_sharp),
              color: Colors.black,
          ),
        ],
      ),
      //extendBodyBehindAppBar: true,
        body: Container(
          margin: EdgeInsets.all(5.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  shape:  BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/cristyan bohn.jpg'),
                    fit: BoxFit.fill,
                  ),
                  /*borderRadius: BorderRadius.all(Radius.circular(52.0)),
                  border: Border.all(
                    color: Colors.amber,
                    width: 1.0
                  )*/
                ),
                ),
              Container(
                width: 50.0,
                height: 50.0,
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  shape:  BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/klaus nielsen.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: 50.0,
                height: 50.0,
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  shape:  BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/luthfi ramaditya.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: 50.0,
                height: 50.0,
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  shape:  BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/mikhail nilov.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: 50.0,
                height: 50.0,
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  shape:  BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('sinitta leunen.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

