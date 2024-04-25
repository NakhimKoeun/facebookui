import 'package:facebookui/Models/Post_model.dart';
import 'package:facebookui/Widget/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hearderpost(post: post),
                SizedBox(
                  height: 10,
                ),
                Text("${post.caption}"),
                post.imageUrl != null
                    ? SizedBox.shrink()
                    : SizedBox(
                        height: 6,
                      ),
              ],
            ),
          ),
          post.imageUrl != null
              ? Image.network(post.imageUrl!)
              : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: _postcount(
              post: post,
            ),
          )
        ],
      ),
    );
  }
}

class Hearderpost extends StatelessWidget {
  const Hearderpost({
    super.key,
    required this.post,
  });
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        profile_avatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${post.user.name}"),
              Row(
                children: [
                  Text("${post.timeAgo} - "),
                  const Icon(
                    Icons.public,
                    color: Colors.grey,
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
      ],
    );
  }
}

class _postcount extends StatelessWidget {
  const _postcount({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(4),
                decoration:
                    BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                child: Icon(
                  Icons.thumb_up,
                  color: Colors.white,
                  size: 10,
                ),
              ),
            ),
            Expanded(child: Text("${post.likes} Likes")),
            Text("${post.comments} Comments"),
            SizedBox(
              width: 8.0,
            ),
            Text("${post.shares} Share"),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                Icons.thumb_up,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Like',
              onTap: () => print('Like'),
            ),
            _PostButton(
              icon: Icon(
                Icons.comment,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comment',
              onTap: () => print('Comment'),
            ),
            _PostButton(
              icon: Icon(
                Icons.share,
                color: Colors.grey[600],
                size: 25.0,
              ),
              label: 'Share',
              onTap: () => print('Share'),
            )
          ],
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final onTap;

  const _PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
