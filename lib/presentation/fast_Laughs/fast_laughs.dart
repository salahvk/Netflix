import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/presentation/download/core/color.dart';
import 'package:netflix/presentation/download/core/constants.dart';

class Fast extends StatelessWidget {
  const Fast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      children: List.generate(
          10,
          (index) => Stack(
                children: [
                  Container(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: CircleAvatar(
                                backgroundColor: kblack.withOpacity(0.7),
                                radius: 25,
                                child: Icon(
                                  Icons.volume_off,
                                  color: kwhite,
                                )),
                          )
                        ],
                      ),
                    ),
                    color: Colors.accents[index],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                "https://th.bing.com/th/id/OIP.kZ5pi91lDwwFZolIwl5gmwHaJQ?pid=ImgDet&rs=1"),
                          ),
                          kheight,
                          IconsLaugh(
                            icon: Icons.emoji_emotions,
                            title: 'LOL',
                          ),
                          IconsLaugh(icon: Icons.add, title: 'My List'),
                          IconsLaugh(
                            icon: Icons.send,
                            title: 'Share',
                            x: -50,
                          ),
                          IconsLaugh(
                            icon: Icons.play_arrow,
                            title: 'Play',
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
    ));
  }
}

class IconsLaugh extends StatelessWidget {
  const IconsLaugh(
      {Key? key,
      required this.icon,
      required this.title,
      this.x = 0,
      this.size = 25})
      : super(key: key);
  final IconData icon;
  final String title;
  final double x;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.rotate(
          angle: x * pi / 180,
          child: Icon(
            icon,
            size: size,
            color: kwhite,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
        ),
        kheight
      ],
    );
  }
}
