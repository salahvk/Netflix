import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../download/core/color.dart';
import '../../download/core/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, required this.icon, required this.title, this.size = 25})
      : super(key: key);
  final IconData icon;
  final String title;

  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaIcon(
          icon,
          size: size,
          color: kwhite,
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
