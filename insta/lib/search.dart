import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'stagger.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Column(
          children: [
            Row(
                children: [
                    Container(
                    margin: const EdgeInsets.only(top: 40.0,left: 10.0),
                    height: 40,
                    width: 290,
                    child: const TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
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
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search_outlined),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
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
              ),
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
              child: StaggerPage(),
            ),
          ]
        ),
      ),
    );
  }
}