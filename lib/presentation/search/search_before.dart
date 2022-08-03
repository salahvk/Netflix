import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/presentation/download/core/color.dart';
import 'package:netflix/presentation/download/core/constants.dart';
import 'package:netflix/presentation/search/search_after.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);

  final searchImage = [
    "https://th.bing.com/th/id/R.bf1553c09f4358b173830664659a290b?rik=Ba20yCFxZUWGEQ&riu=http%3a%2f%2f1.bp.blogspot.com%2f-yI1TQLAW9E8%2fThFudKO5xRI%2fAAAAAAAABh4%2f3uA8mW2P0zs%2fs1600%2flost-season-5-wallpaper.jpg&ehk=%2fc5RJhnB79aoAYmOzWXE2bZD2BP5wCIEL2e9Jjh9OAI%3d&risl=&pid=ImgRaw&r=0"
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
          body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              style: const TextStyle(color: kwhite),
              backgroundColor: Colors.grey.shade700,
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
              ),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Colors.grey.shade300,
              ),
              prefixInsets: EdgeInsetsDirectional.only(start: width * 0.35),
            ),
            kheight,
            const ListName(
              name: 'Movies & Tv',
            ),
            kheight,
            // Expanded(child: List_idle(width: width, searchImage: searchImage)),
            SearchAfter()
          ],
        ),
      )),
    );
  }
}

class ListName extends StatelessWidget {
  const ListName({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        ),
      ],
    );
  }
}

class List_idle extends StatelessWidget {
  const List_idle({
    Key? key,
    required this.width,
    required this.searchImage,
  }) : super(key: key);

  final double width;
  final List<String> searchImage;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, index) {
          return Row(
            children: [
              Container(
                width: width * 0.4,
                height: width * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(searchImage[0])),
                ),
              ),
              const Expanded(child: Text('Movie name')),
              const CircleAvatar(
                radius: 32,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundColor: kblack,
                  radius: 29,
                  child: Icon(
                    CupertinoIcons.play_fill,
                    color: kwhite,
                  ),
                ),
              ),
              kwidth
            ],
          );
        },
        separatorBuilder: (ctx, index) {
          return const SizedBox(
            height: 5,
          );
        },
        itemCount: 20);
  }
}
