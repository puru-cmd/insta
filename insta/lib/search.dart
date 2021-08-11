import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'stagger.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String name = '';
  final TextEditingController _searchController = TextEditingController();

  searchField(){
    return AppBar(
      title:TextField(
        autocorrect: true,
        decoration: const InputDecoration(
          //labelText: 'Search',
          filled: true,
          fillColor: Colors.white24,
          // enabledBorder: OutlineInputBorder(
          //     borderSide: BorderSide(
          //         color: Colors.grey,
          //         width: 0.0
          //     ),
          //     borderRadius: BorderRadius.all(Radius.circular(10.0))
          // ),
          hintText: 'Search User...',
          prefixIcon: Icon(Icons.search_outlined),
          hintStyle: TextStyle(color: Colors.grey),
        ),
        onChanged: (val){
          setState(() {
            name = val;
          });
        },
        // controller: _searchController,
      ),
      /*actions: [
        TextButton.icon(
            onPressed: ()async{
              Stream<QuerySnapshot> user = _firestore.collection('users')
                  .where('name', isGreaterThanOrEqualTo: _searchController.text).snapshots();
              builder(search: user,);
            },
            icon: const Icon(Icons.search),
            label: const Text('Search'),
        )
      ],*/
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchField(),
      body:StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('users')
              .where('name',isGreaterThanOrEqualTo:name).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasData) {
              return Scaffold(
                body: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = snapshot.data!.docs[index];
                      // children: snapshot.data!.docs.map((DocumentSnapshot document){
                      //   Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                      return GestureDetector(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage('${doc['profileUrl']}'),
                            backgroundColor: Colors.transparent,
                          ),
                          title: Text('${doc['name']}'),
                          subtitle: Text('${doc['bio']}'),
                        ),
                        onTap: (){

                        },
                      );
                    }
                ),
              );
            }
            return const Text('Loading...');
          }
      )
      /*SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Column(
          children: [
            /*Row(
                children: [
                    Container(
                    margin: const EdgeInsets.only(top: 40.0,left: 10.0),
                    height: 40,
                    width: 290,
                    child: TextField(
                      autocorrect: true,
                      decoration: const InputDecoration(
                        //labelText: 'Search',
                        filled: true,
                        fillColor: Colors.white24,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                             color: Colors.grey,
                            width: 0.0
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        hintText: 'Search User...',
                        prefixIcon: Icon(Icons.search_outlined),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      controller: _searchController,
                    ),
                  ),
                   Container(
                   margin: const EdgeInsets.only(top: 40.0,right: 10.0),
                      child:IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.qr_code_scanner_outlined),
                        color: Colors.grey,
                      ),
                   ),
                ],
              ),*/
             Container(
               //margin: EdgeInsets.only(top: 2.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Container(
                      margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                          child:RaisedButton.icon(
                            onPressed: (){},
                            icon: const Icon(Icons.live_tv_outlined,size: 20,),
                            label: const Text('IGTV'),
                            elevation: 2.0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                      ),
                       Container(
                          margin: const EdgeInsets.only(right: 10.0),
                            child: RaisedButton.icon(
                              onPressed: (){},
                              icon: const Icon(Icons.shopping_bag,size: 20,),
                              label: const Text('Shop'),
                              elevation: 2.0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                          )
                        ),
                        Container(
                            margin: const EdgeInsets.only(right: 10.0),
                            child: RaisedButton(
                              onPressed: (){},
                              //icon: const Icon(Icons.shopping_bag,size: 20,),
                              child: const Text('Style'),
                              elevation: 2.0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.only(right: 10.0),
                            child: RaisedButton(
                              onPressed: (){},
                              //icon: const Icon(Icons.shopping_bag,size: 20,),
                              child: const Text('Sports'),
                              elevation: 2.0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.only(right: 10.0),
                            child: RaisedButton(
                              onPressed: (){},
                              //icon: const Icon(Icons.shopping_bag,size: 20,),
                              child: const Text('Audio'),
                              elevation: 2.0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            )
                        ),
                      ],
                    ),
                ),
             ),
            SizedBox(
              height: 500,
              child:StaggerPage(),
            ),
          ]
        ),
      ),*/
    );
  }
}

