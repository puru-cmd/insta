import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/home_page.dart';
import 'package:untitled/profile.dart';
import 'package:untitled/upload_post.dart';
import 'search.dart';
import 'notification.dart';


class MyNavBar extends StatefulWidget {
  const MyNavBar({Key? key}) : super(key: key);

  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  String imageUrl = 'https://cdn4.iconfinder.com/data/icons/mayssam/512/add_user-512.png';
  late SharedPreferences loginData;

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


  int _currentIndex = 0;
  final List _children = [
    const MyPage(),
    const SearchPage(),
    const UploadPost(),
    const NotificationPage(),
    const ProfilePage(),
  ];

  void onTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          elevation: 5.0,
          onTap: onTapped,
          currentIndex: _currentIndex,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            title: Text('Home'),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            title: Text('Search'),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            title: Text('Add'),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded),
            title: Text('like'),
          ),
          BottomNavigationBarItem(
            icon: Container(
              //margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: 12.0,
                backgroundImage: NetworkImage(imageUrl),
                backgroundColor: Colors.white,
              ),
              // decoration: const BoxDecoration(
              //   shape: BoxShape.circle,
              //   gradient: LinearGradient(
              //     colors: [
              //       Colors.amber,
              //       Colors.red,
              //     ]
              // ),
              // ),
            ),
            title: const Text('profile'),
          ),
        ],
      ),
    );
  }
}