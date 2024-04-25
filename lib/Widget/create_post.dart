import 'package:facebookui/Models/User_model.dart';
import 'package:facebookui/Widget/Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreatePost extends StatelessWidget {
  CreatePost({super.key, required this.currentUser});
  final User currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              profile_avatar(imageUrl: currentUser.imageUrl),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "What's on your mind"),
                ),
              )
            ],
          ),
          Divider(
            height: 10.0,
            thickness: 0.5,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                    onPressed: null,
                    icon: Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: Text("Live")),
                VerticalDivider(
                  width: 10.0,
                ),
                TextButton.icon(
                    onPressed: null,
                    icon: Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: Text("Photo")),
                VerticalDivider(
                  width: 10.0,
                ),
                TextButton.icon(
                    onPressed: null,
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.pink,
                    ),
                    label: Text("Room")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
