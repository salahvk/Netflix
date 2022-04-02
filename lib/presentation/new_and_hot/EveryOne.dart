import 'package:flutter/material.dart';

import '../download/core/color.dart';

class EveryOne extends StatelessWidget {
  const EveryOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'data',
        style:
            TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: kwhite),
      ),
    );
  }
}
