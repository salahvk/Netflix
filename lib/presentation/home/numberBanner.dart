import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/presentation/download/core/color.dart';

import '../download/core/constants.dart';

class NumberBanners extends StatelessWidget {
  const NumberBanners({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          10,
          (index) => Stack(
            children: [
              Row(
                children: [
                  kwidth2,
                  Container(
                    width: width * 0.3,
                    height: width * 0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage(image1))),
                  ),
                ],
              ),
              Positioned(
                left: 10,
                bottom: -10,
                child: BorderedText(
                  strokeColor: kwhite,
                  strokeWidth: 5,
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(fontSize: 70, color: kblack),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
