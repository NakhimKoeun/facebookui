import 'package:facebookui/config/plate.dart';
import 'package:flutter/material.dart';

class profile_avatar extends StatelessWidget {
  const profile_avatar(
      {super.key,
      required this.imageUrl,
      this.isActive = false,
      this.hasBorder = false});
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: hasBorder ? 17 : 20,
            backgroundColor: Colors.grey[20],
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                      color: Palette.online,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2.0, color: Colors.white)),
                ),
              )
            : SizedBox.shrink()
      ],
    );
  }
}
