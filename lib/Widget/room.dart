import 'package:facebookui/Models/User_model.dart';
import 'package:facebookui/Widget/Widget.dart';
import 'package:flutter/material.dart';

class Room extends StatelessWidget {
  const Room({super.key, required this.onlineUser});
  final List<User> onlineUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUser.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: _CreateRoomButtom(),
            );
          }
          final User user = onlineUser[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: profile_avatar(
              imageUrl: user.imageUrl,
              isActive: true,
            ),
          );
        },
      ),
    );
  }
}

class _CreateRoomButtom extends StatelessWidget {
  const _CreateRoomButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print("Create Room"),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
      ),
      child: Icon(Icons.video_call),
    );
  }
}
