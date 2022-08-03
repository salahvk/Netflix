import 'package:flutter/material.dart';
import 'package:netflix/presentation/download/core/constants.dart';
import '../download/core/color.dart';
import '../fast_Laughs/fast_laughs.dart';

class EveryOne extends StatelessWidget {
  const EveryOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, int) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Friends',
                  style: text3,
                ),
                kheight,
                Text(
                  'Landling the lead in the school musical is a \ndream come true for jodi,until the pressure \nsends her condidence - and her relationship - ',
                  style: TextStyle(
                    height: 1.3,
                    color: Colors.grey,
                  ),
                ),
                kheight3,
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                image3,
                              ),
                              fit: BoxFit.cover)),
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
                kheight,
                Row(
                  children: [
                    Spacer(),
                    IconsLaugh(
                      icon: Icons.send,
                      title: 'Share',
                      x: -50,
                    ),
                    kwidth,
                    IconsLaugh(icon: Icons.add, title: 'My List'),
                    kwidth,
                    IconsLaugh(
                      icon: Icons.play_arrow,
                      title: 'Play',
                    ),
                    kwidth
                  ],
                )
              ],
            ),
            width: double.infinity,
            height: 500,
          );
        },
        separatorBuilder: (ctx, int) {
          return kheight;
        },
        itemCount: 10);
  }
}
