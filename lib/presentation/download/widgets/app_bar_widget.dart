import 'package:flutter/material.dart';
import 'package:netflix/presentation/download/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Downloads',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        kwidth,
        Container(
          color: Colors.blue,
          width: 30,
          height: 30,
        )
      ],
    );
  }
}
