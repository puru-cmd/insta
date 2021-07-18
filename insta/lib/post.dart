import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({Key? key,
    required this.photo,
    required this.name,
    required this.caption,
    required this.post_photo,
    required this.like_photo,
    required this.like_name,
    required this.like_no,
    required this.post_caption,
  }) : super(key: key);

  final photo;
  final name;
  final caption;
  final post_photo;
  final like_photo;
  final like_name;
  final like_no;
  final post_caption;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage(widget.photo),
              ),
              Expanded(
                child: ListTile(
                  title: Text(widget.name),
                  subtitle: Text(widget.caption),
                ),
              ),
            ],
          ),
        ),
        Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 0.0),
        child: Image.asset(widget.post_photo),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: _pressed?Image.asset('assets/red_heart.png'):Image.asset('assets/heart.png'),
                onPressed: (){
                  setState(() {
                    _pressed = !_pressed;
                  });
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
        Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(15.0,0.0,5.0,5.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(widget.like_photo),
                radius: 10.0,
              ),
            ),
            Text(
              'Liked by ${widget.like_name} and ${widget.like_no} others'
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 18.0),
          child: Text(widget.post_caption),
        ),
      ],
    );
  }
}
