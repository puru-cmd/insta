import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'status_widget.dart';
import 'post.dart';


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
              children: const [
                Status(photo: 'assets/cristyan bohn.jpg',name: 'Your Story'),
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
          Column(
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
          ),
        ],
      ),
      //bottomNavigationBar: const MyNavBar(),
    );

  }
}






