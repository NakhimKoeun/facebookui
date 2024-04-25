import 'package:facebookui/List_Data/Data_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Models/Post_model.dart';
import '../Widget/Widget.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "facebook",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            actions: [
              BottomWidget(
                icon: Icons.search,
                iconSize: 23,
                onPressed: () {},
              ),
              BottomWidget(
                icon: Icons.message,
                iconSize: 23,
                onPressed: () {},
              )
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePost(currentUser: currentUser),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(5),
            sliver: SliverToBoxAdapter(
              child: Room(
                onlineUser: onlineUsers,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(5),
            sliver: SliverToBoxAdapter(
              child: Stories(
                currentUser: currentUser,
                stories: stories,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            final Post post = posts[index];
            return PostContainer(post: post);
          }, childCount: posts.length))
        ],
      ),
    );
  }
}
