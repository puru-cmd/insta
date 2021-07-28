import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/second_page.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences loginData;
  late String userName;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial()async{
    loginData = await SharedPreferences.getInstance();
    setState(() {
      userName = loginData.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: (){},
                icon: const Icon(Icons.lock,size: 15.0,color: Colors.black),
            ),
            /*const DefaultTextStyle(
              style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w500),
              child: Text('cristyan_bohn'),
            ),*/
            SizedBox(
              height: 25,
              width: 135,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  iconSize: 26,
                  elevation: 0,
                  isExpanded: true,
                  hint: const Text('cristyan_bohn'),
                  icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                  items: [
                    DropdownMenuItem(
                      value: 'One',
                        child: TextButton(
                          onPressed: (){
                            loginData.setBool('login',true);
                            Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => const SecondPage()));
                          },
                          child: const Text('Log Out'),
                        ),
                      )
                    ],
                    onChanged: (String? value){
                      setState(() {
                        //_value = value!;
                      });
                    },
                  ) ,
                )//value: _value,
              )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                    Container(
                      //margin: const EdgeInsets.all(2.0),
                      padding: const  EdgeInsets.all(3.0),
                      child: const CircleAvatar(
                        radius: 38.0,
                        backgroundImage: AssetImage('assets/cristyan bohn.jpg'),
                        backgroundColor: Colors.white,
                      ),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [
                              Colors.amber,
                              Colors.red,
                            ]
                        ),
                      ),
                    ),
                    Column(
                      children: const [
                        Text('54'),
                        Text('Posts'),
                      ],
                    ),
                    Column(
                      children: const [
                        Text('834'),
                        Text('Followers'),
                      ],
                    ),
                    Column(
                      children: const [
                        Text('162'),
                        Text('Following'),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
                  child: const Text(
                      'Cristyan Bohn\n'
                      'Digital goodies designer\n'
                      'Everything is designed',style: TextStyle(fontSize: 13.0),),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
                  child: RaisedButton(
                      onPressed: (){},
                      child: const Text('Edit Profile',style: TextStyle(fontWeight: FontWeight.w400),),
                    color: Colors.white,
                    elevation: 1.0,
                  ),
                ),
                GridView.count(
                    crossAxisCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    //scrollDirection: Axis.vertical,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    shrinkWrap: true,
                    children: [
                      Container(
                        child: Image.asset('assets/alex.jpg',fit: BoxFit.cover,),
                      ),
                      Container(
                        child: Image.asset('assets/anna.jpg',fit: BoxFit.cover,),
                      ),
                      Container(
                        child: Image.asset('assets/charlotte.jpg',fit: BoxFit.cover,),
                      ),
                      Container(
                        child: Image.asset('assets/damir.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/duong.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/eman.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/jade.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/jessy.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/osmar.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/teddy.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/trarete.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/migaj.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/studio.jpg',fit: BoxFit.cover),
                      ),
                      Container(
                        child: Image.asset('assets/parker.jpg',fit: BoxFit.cover),
                      ),
                    ],
                  ),
              ],
          ),
        ),
    );
  }
}


