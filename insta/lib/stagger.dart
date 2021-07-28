import 'package:flutter/material.dart';
//import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggerPage extends StatefulWidget {
  @override
  _StaggerPageState createState() => _StaggerPageState();
}

class _StaggerPageState extends State<StaggerPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: StaggeredGridView.count(
              crossAxisCount: 3,
              //shrinkWrap: true,
              //primary: true,
              //physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            staggeredTiles: [
              StaggeredTile.count(2, 2),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(2, 2),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
            ],
            children: [
              Image.asset('assets/alex.jpg',fit: BoxFit.cover,),
              Image.asset('assets/anna.jpg',fit: BoxFit.cover,),
              Image.asset('assets/charlotte.jpg',fit: BoxFit.cover,),
              Image.asset('assets/damir.jpg',fit: BoxFit.cover,),
              Image.asset('assets/duong.jpg',fit: BoxFit.cover,),
              Image.asset('assets/eman.jpg',fit: BoxFit.cover,),
              Image.asset('assets/jade.jpg',fit: BoxFit.cover,),
              Image.asset('assets/jessy.jpg',fit: BoxFit.cover,),
              Image.asset('assets/osmar.jpg',fit: BoxFit.cover,),
              Image.asset('assets/teddy.jpg',fit: BoxFit.cover,),
              Image.asset('assets/trarete.jpg',fit: BoxFit.cover,),
              Image.asset('assets/migaj.jpg',fit: BoxFit.cover,),
              Image.asset('assets/studio.jpg',fit: BoxFit.cover,),
              Image.asset('assets/parker.jpg',fit: BoxFit.cover,),
            ],

          ),
    );
  }
}