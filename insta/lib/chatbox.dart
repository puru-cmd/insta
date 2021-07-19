import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new,color: Colors.black,),
        ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DefaultTextStyle(
                style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w500),
                child: Text('cristyan_bohn'),
              ),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,)
              )
            ],
          ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const Icon(Icons.add,color: Colors.black,),
          )
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15.0,right: 15.0),
            height: 35,
            child: const TextField(
              autocorrect: true,
              decoration: InputDecoration(
                //labelText: 'Search',
                filled: true,
                fillColor: Colors.white10,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.0
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                hintText: 'Search',
                prefixIcon: Icon(Icons.search_outlined),
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          ListTile(
              leading: Container(
                //margin: const EdgeInsets.all(2.0),
                //padding: const  EdgeInsets.all(3.0),
                child: const CircleAvatar(
                  radius: 38.0,
                  backgroundImage: AssetImage('assets/bohn.jpg'),
                  backgroundColor: Colors.white,
                ),
              ),
              title: const Text('Bohn'),
              subtitle: const Text('Have a nice day.bro!'),
              trailing: IconButton(
                onPressed: (){},
                icon: Image.asset('assets/camera.png'),
                iconSize: 10.0,
              ),
            ),
          ListTile(
            leading: Container(
              //margin: const EdgeInsets.all(2.0),
              //padding: const  EdgeInsets.all(3.0),
              child: const CircleAvatar(
                radius: 38.0,
                backgroundImage: AssetImage('assets/carmo.jpg'),
                backgroundColor: Colors.white,
              ),
            ),
            title: const Text('Carmo'),
            subtitle: const Text('I heard this is a good movie'),
            trailing: IconButton(
              onPressed: (){},
              icon: Image.asset('assets/camera.png'),
              iconSize: 10.0,
            ),
          ),
          ListTile(
            leading: Container(
              //margin: const EdgeInsets.all(2.0),
              //padding: const  EdgeInsets.all(3.0),
              child: const CircleAvatar(
                radius: 38.0,
                backgroundImage: AssetImage('assets/charles.jpg'),
                backgroundColor: Colors.white,
              ),
            ),
            title: const Text('Charles'),
            subtitle: const Text('See you on the next meeting!'),
            trailing: IconButton(
              onPressed: (){},
              icon: Image.asset('assets/camera.png'),
              iconSize: 10.0,
            ),
          ),
          ListTile(
            leading: Container(
              //margin: const EdgeInsets.all(2.0),
              //padding: const  EdgeInsets.all(3.0),
              child: const CircleAvatar(
                radius: 38.0,
                backgroundImage: AssetImage('assets/jade.jpg'),
                backgroundColor: Colors.white,
              ),
            ),
            title: const Text('Jade'),
            subtitle: const Text('Sounds good'),
            trailing: IconButton(
              onPressed: (){},
              icon: Image.asset('assets/camera.png'),
              iconSize: 10.0,
            ),
          ),
          ListTile(
            leading: Container(
              //margin: const EdgeInsets.all(2.0),
              //padding: const  EdgeInsets.all(3.0),
              child: const CircleAvatar(
                radius: 38.0,
                backgroundImage: AssetImage('assets/osmar.jpg'),
                backgroundColor: Colors.white,
              ),
            ),
            title: const Text('Osmar'),
            subtitle: const Text('The new design looks, cool'),
            trailing: IconButton(
              onPressed: (){},
              icon: Image.asset('assets/camera.png'),
              iconSize: 10.0,
            ),
          ),
          ListTile(
            leading: Container(
              //margin: const EdgeInsets.all(2.0),
              //padding: const  EdgeInsets.all(3.0),
              child: const CircleAvatar(
                radius: 38.0,
                backgroundImage: AssetImage('assets/teddy.jpg'),
                backgroundColor: Colors.white,
              ),
            ),
            title: const Text('Teddy'),
            subtitle: const Text('Yeap, I\'m going to travel in To...'),
            trailing: IconButton(
              onPressed: (){},
              icon: Image.asset('assets/camera.png'),
              iconSize: 10.0,
            ),
          ),
          ListTile(
            leading: Container(
              //margin: const EdgeInsets.all(2.0),
              //padding: const  EdgeInsets.all(3.0),
              child: const CircleAvatar(
                radius: 38.0,
                backgroundImage: AssetImage('assets/trarete.jpg'),
                backgroundColor: Colors.white,
              ),
            ),
            title: const Text('Trarete'),
            subtitle: const Text('Thank you, bro!'),
            trailing: IconButton(
              onPressed: (){},
              icon: Image.asset('assets/camera.png'),
              iconSize: 10.0,
            ),
          ),
          ListTile(
            leading: Container(
              //margin: const EdgeInsets.all(2.0),
              //padding: const  EdgeInsets.all(3.0),
              child: const CircleAvatar(
                radius: 38.0,
                backgroundImage: AssetImage('assets/luthfi ramaditya.jpg'),
                backgroundColor: Colors.white,
              ),
            ),
            title: const Text('Luthfi Ramaditya'),
            subtitle: const Text('Instagram UI is pretty good'),
            trailing: IconButton(
              onPressed: (){},
              icon: Image.asset('assets/camera.png'),
              iconSize: 10.0,
            ),
          ),
          ListTile(
            leading: Container(
              //margin: const EdgeInsets.all(2.0),
              //padding: const  EdgeInsets.all(3.0),
              child: const CircleAvatar(
                radius: 38.0,
                backgroundImage: AssetImage('assets/charlote.jpg'),
                backgroundColor: Colors.white,
              ),
            ),
            title: const Text('Bohn'),
            subtitle: const Text('Have a nice day.bro!'),
            trailing: IconButton(
              onPressed: (){},
              icon: Image.asset('assets/camera.png'),
              iconSize: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
