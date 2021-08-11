// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'status_widget.dart';
import 'post.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;
class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  late SharedPreferences loginData;
  String imageUrl = 'https://cdn4.iconfinder.com/data/icons/mayssam/512/add_user-512.png';

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial()async{
    await Firebase.initializeApp();
    loginData = await SharedPreferences.getInstance();
    setState(() {
      imageUrl = loginData.getString('profileUrl')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){},
          icon: Image.asset('assets/camera.png'),
          iconSize: 30.0,
        ),
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
        title: IconButton(
          onPressed: (){},
          icon: Image.asset('assets/Instagram-Logo.png'),
          iconSize: 130.0,
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Image.asset('assets/tv.png'),
            iconSize: 30.0,
          ),
          IconButton(
            onPressed: (){
              Navigator.of(context).pushNamed('/chat',arguments: 'chat');
            },
            icon: Image.asset('assets/message.png'),
            iconSize: 30.0,
          ),
        ],
      ),
      //extendBodyBehindAppBar: true,
      body:ListView(
        scrollDirection: Axis.vertical,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            //margin: const EdgeInsets.all(1.0),
            child: Row(
              children:  [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                      //margin: const EdgeInsets.all(2.0),
                      padding: const  EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        radius: 38.0,
                        backgroundImage: NetworkImage(imageUrl),
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
                  const Text('Your Story'),
                ],
              ),
            ),
                Status(photo: 'assets/klaus nielsen.jpg',name: 'Klaus Nielsen '),
                Status(photo: 'assets/luthfi ramaditya.jpg',name: 'Ramaditya'),
                Status(photo: 'assets/meijii.jpg',name: 'Meijii'),
                Status(photo: 'assets/mikhail nilov.jpg',name: 'Mikhail Nilov'),
                Status(photo: 'assets/sinitta leunen.jpg',name: 'Sinitta Leunen'),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          Builder(),
         /* Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
               Post(
                photo: 'assets/sinitta leunen.jpg',
                name: 'Sinitta Leunen',
                caption: 'Tokyo_Japan',
                post_photo: 'assets/carmo.jpg',
                like_photo: 'assets/luthfi ramaditya.jpg',
                like_name: 'Ramaditya',
                like_no: '4,758',
                post_caption: 'Sinitta Leunen The game in Japan was amazing and I\n want'
                    ' to share some photos',
              ),
              Post(
                photo: 'assets/klaus nielsen.jpg',
                name: 'Klaus Nielsen',
                caption: 'Germany',
                post_photo: 'assets/bohn.jpg',
                like_photo: 'assets/cristyan bohn.jpg',
                like_name: 'Cristyan Bohn',
                like_no: '2,334',
                post_caption: 'Klaus Nielsen Random Click',
              ),
              Post(
                photo: 'assets/mikhail nilov.jpg',
                name: 'Mikhail Nilov',
                caption: 'Los Angeles',
                post_photo: 'assets/charles.jpg',
                like_photo: 'assets/meijii.jpg',
                like_name: 'Meijii',
                like_no: '59,546',
                post_caption: 'Mikhail Nilov Happiness',
              ),
              Post(
                photo: 'assets/cristyan bohn.jpg',
                name: 'Cristyan Bohn',
                caption: 'France',
                post_photo: 'assets/jess.jpg',
                like_photo: 'assets/meijii.jpg',
                like_name: 'Meijii',
                like_no: '65',
                post_caption: 'Cristyan Bohn Soar of sea!!',
              ),
              Post(
                photo: 'assets/luthfi ramaditya.jpg',
                name: 'Ramaditya',
                caption: 'Rann of Kuchh',
                post_photo: 'assets/maxim.jpg',
                like_photo: 'assets/mikhail nilov.jpg',
                like_name: 'Mikhail Nilov',
                like_no: '5,466',
                post_caption: 'Ramaditya Indian salt factory',
              ),
              Post(
                photo: 'assets/meijii.jpg',
                name: 'Meijii',
                caption: 'Netherlands',
                post_photo: 'assets/nadi.jpg',
                like_photo: 'assets/klaus nielsen.jpg',
                like_name: 'Klaus Nielsen',
                like_no: '4,768',
                post_caption: 'Meijii Wheat field',
              ),
              Post(
                photo: 'assets/sinitta leunen.jpg',
                name: 'Sinitta Leunen',
                caption: 'New York',
                post_photo: 'assets/spot.jpg',
                like_photo: 'assets/luthfi ramaditya.jpg',
                like_name: 'Ramaditya',
                like_no: '749',
                post_caption: 'Sinitta Leunen Blue Heavean',
              ),
              Post(
                photo: 'assets/klaus nielsen.jpg',
                name: 'Klaus Nielsen',
                caption: 'London',
                post_photo: 'assets/parker.jpg',
                like_photo: 'assets/mikhail nilov.jpg',
                like_name: 'Mikhail Nilov',
                like_no: '689',
                post_caption: 'Klaus Nielsen Night view',
              ),
              Post(
                photo: 'assets/mikhail nilov.jpg',
                name: 'Mikhail Nilov',
                caption: 'Connaught place',
                post_photo: 'assets/studio.jpg',
                like_photo: 'assets/meijii.jpg',
                like_name: 'Meijii',
                like_no: '3,579',
                post_caption: 'Mikhail Nilov Art',
              ),
              Post(
                photo: 'assets/mikhail nilov.jpg',
                name: 'Mikhail Nilov',
                caption: 'Photo Shoot',
                post_photo: 'assets/trarete.jpg',
                like_photo: 'assets/sinitta leunen.jpg',
                like_name: 'Sinitta Leunen',
                like_no: '765',
                post_caption: 'Mikhail Nilov #Studio',
              ),
              Post(
                photo: 'assets/luthfi ramaditya.jpg',
                name: 'Ramaditya',
                caption: 'Egypt',
                post_photo: 'assets/yes.jpg',
                like_photo: 'assets/meijii.jpg',
                like_name: 'Meijii',
                like_no: '6,759',
                post_caption: 'Ramaditya #Wanderlust',
              ),
            ],
          ),*/
        ],
      ),
      //bottomNavigationBar: const MyNavBar(),
    );

  }
}

class Builder extends StatelessWidget {
  const Builder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _pressed = false;

    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('post').orderBy('time',descending: true).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData) {
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data!.docs[index];
                  // children: snapshot.data!.docs.map((DocumentSnapshot document){
                  //   Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 10.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage: NetworkImage(doc['profile']),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(doc['name']),
                                subtitle: Text(doc['location']),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 0.0),
                        child: Image.network(doc['image']),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: _pressed?Image.asset('assets/red_heart.png'):Image.asset('assets/heart.png'),
                              onPressed: (){
                                  _pressed = !_pressed;
                                final snackbar = SnackBar(
                                  content: const Text('You have liked post'),
                                  duration: const Duration(seconds: 2),
                                  action: SnackBarAction(
                                    textColor: Colors.amber,
                                    label: 'Undo',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(snackbar);
                              },
                              iconSize: 30.0,
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Image.asset('assets/comment.png'),
                              iconSize: 30.0,
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Image.asset('assets/message.png'),
                              iconSize: 30.0,
                            ),
                          ],
                        ),
                      ),
                      Text(
                          'Liked by  ${doc['likes']} others'
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 18.0),
                        child: Text(doc['description']),
                      ),
                    ],
                  );
                }
            );
          }
          return const Text('Loading...');
        }
    );
  }
}

GestureDetector(){

}





