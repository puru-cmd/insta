import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({Key? key, required this.photo,required this.name}) : super(key: key);
  final String photo;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            //margin: const EdgeInsets.all(2.0),
            padding: const  EdgeInsets.all(3.0),
            child: CircleAvatar(
              radius: 38.0,
              backgroundImage: AssetImage(photo),
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
          Text(name),
        ],
      ),
    );
  }
}