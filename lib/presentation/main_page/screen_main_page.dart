import 'package:flutter/material.dart';
import 'package:netflix/core_items/color.dart';
import 'package:netflix/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix/presentation/new_and_hot/new.dart';

import '../download/download.dart';
import '../fast_Laughs/fast_laughs.dart';
import '../home/home.dart';
import '../search/search_before.dart';

class ScreenMainPage extends StatelessWidget {
  final list = [Home(), New_and_Hot(), Fast(), Search(), Download()];
  ScreenMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: indexChanger,
          builder: (BuildContext, int Index, _) {
            return list[Index];
          }),
      bottomNavigationBar: BottomNav(),
    );
  }
}
