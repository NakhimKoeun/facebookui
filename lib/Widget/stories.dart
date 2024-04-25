import 'package:facebookui/Widget/profile_avatar.dart';
import 'package:facebookui/config/plate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Models/Modes.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({
    Key? key,
    required this.currentUser,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 200,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        itemCount: 1 + stories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: _Storycard(
                isAddStory: true,
                currentUser: currentUser,
              ),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: _Storycard(
              story: story,
            ),
          );
        },
      ),
    );
  }
}

class _Storycard extends StatelessWidget {
  final bool isAddStory;
  final User? currentUser;
  final Story? story;

  const _Storycard({
    Key? key,
    this.isAddStory = false,
    this.currentUser,
    this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            isAddStory ? currentUser!.imageUrl : story!.imageUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Positioned(
            top: 8.0,
            left: 8.0,
            child: isAddStory
                ? profile_avatar(imageUrl: currentUser!.imageUrl)
                : profile_avatar(
                    imageUrl: story!.user.imageUrl,
                    hasBorder: story!.isViewed,
                  )),
        Positioned(
            left: 8.0,
            right: 8.0,
            bottom: 8.0,
            child: Text(
              isAddStory ? "Add Story" : story!.user.name,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
