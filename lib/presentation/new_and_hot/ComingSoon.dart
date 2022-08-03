import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/presentation/download/core/color.dart';
import 'package:netflix/presentation/new_and_hot/EveryOne.dart';
import 'package:netflix/presentation/new_and_hot/widgets/CustomButton.dart';

import '../download/core/constants.dart';

class NewandHot extends StatelessWidget {
  NewandHot({Key? key}) : super(key: key);

  final list = [ComingSoon(), EveryOne()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: NewAppBar(),
        ),
        body: TabBarView(children: list),
      ),
    );
  }
}

class NewAppBar extends StatelessWidget {
  const NewAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: const Text(
        'New & Hot',
        style:
            TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: kwhite),
      ),
      actions: [
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
      bottom: TabBar(
        tabs: [
          Tab(
            text: '🍿 Coming Soon',
          ),
          Tab(
            text: "👀 Everyone's Watching",
          ),
        ],
        isScrollable: true,
        indicator: BoxDecoration(color: kwhite, borderRadius: radius1),
        labelColor: kblack,
        unselectedLabelColor: kwhite,
        padding: EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ListView.separated(
        itemBuilder: (ctx, int) {
          return ComingImageContainer(width: width);
        },
        separatorBuilder: (ctx, int) {
          return kheight2;
        },
        itemCount: 10);
  }
}

class ComingImageContainer extends StatelessWidget {
  const ComingImageContainer({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 50,
              child: Text(
                'FEB\n11',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  width: width - 50,
                  height: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(image2), fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      backgroundColor: kblack.withOpacity(0.7),
                      radius: 25,
                      child: const Icon(
                        Icons.volume_off,
                        color: kwhite,
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'TALL GIRL2',
                  style: GoogleFonts.oswald(
                      fontSize: 25, fontWeight: FontWeight.w700),
                ),
                kwidth2,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      CustomButton(
                          icon: FontAwesomeIcons.bell, title: 'Remind Me'),
                      kwidth,
                      CustomButton(icon: Icons.info, title: 'Info')
                    ],
                  ),
                )
              ],
            ),
            Text('Coming on Friday',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
            kheight2,
            Text("Tall Girl 2", style: TextStyle(fontWeight: FontWeight.w700)),
            kheight,
            Text(
              'Landling the lead in the school musical is a \ndream come true for jodi,until the pressure \nsends her condidence - and her relationship - \ninto a tailspin',
              style: TextStyle(
                height: 1.3,
                color: Colors.grey,
              ),
            )
          ],
        )
      ],
    );
  }
}
