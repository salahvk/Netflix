import 'package:flutter/material.dart';

class New_and_Hot extends StatelessWidget {
  const New_and_Hot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Lost_main_title.svg/500px-Lost_main_title.svg.png',
        width: 50,
        height: 50,
      ),
    );
  }
}
