import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  BottomWidget(
      {super.key,
      required this.icon,
      required this.iconSize,
      required this.onPressed});
  final IconData icon;
  final double iconSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          iconSize: iconSize,
          color: Colors.black,
        ));
  }
}
