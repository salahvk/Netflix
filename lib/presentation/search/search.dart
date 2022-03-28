import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Search',
          style: TextStyle(
              fontWeight: FontWeight.lerp(FontWeight.w300, FontWeight.w600, 5)),
        ),
      ),
    );
  }
}
