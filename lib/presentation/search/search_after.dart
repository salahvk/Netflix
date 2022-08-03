import 'package:flutter/material.dart';

class SearchAfter extends StatelessWidget {
  SearchAfter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
      childAspectRatio: 1 / 1.6,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      crossAxisCount: 3,
      children: List.generate(20, (index) {
        return Maincard();
      }),
    ));
  }
}

class Maincard extends StatelessWidget {
  Maincard({Key? key}) : super(key: key);
  final image = [
    "https://th.bing.com/th/id/R.a6146867e34b55a071832ea9365e617f?rik=zEYqvySEEZo4%2bg&riu=http%3a%2f%2fcdn.pastemagazine.com%2fwww%2farticles%2fTheWitcher-Netflix-TeaserPoster.jpg&ehk=Sg70OBAfCYD9mqccFqFHV3cAZ%2fylhA6JEf4d0HGZmvw%3d&risl=&pid=ImgRaw&r=0",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(image[0]), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
