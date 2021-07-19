import 'package:flutter/material.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                          icon: const Icon(Icons.flip_camera_android_outlined),
                        color: Colors.grey,
                      ),
                   ),
                ],
              ),
            ),
             Container(
               //margin: EdgeInsets.only(top: 2.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Container(
                      margin: EdgeInsets.only(left: 10.0,right: 10.0),
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
                )
             ),
            Container(
              child: GridView.extent(
                //crossAxisCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                //scrollDirection: Axis.vertical,
                maxCrossAxisExtent: 150,
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
            )
          ],
        ),

      ),
    );
  }
}
