import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core_items/color.dart';
import 'package:netflix/presentation/download/core/color.dart';
import 'package:netflix/presentation/download/core/constants.dart';
import 'package:netflix/presentation/home/numberBanner.dart';

ValueNotifier<int> scrollNotifier = ValueNotifier<int>(2);

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<int>(
          valueListenable: scrollNotifier,
          builder: (context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection directions = notification.direction;
                print(directions);
                if (directions == ScrollDirection.reverse) {
                  scrollNotifier.value = 1;
                  print('object');
                } else if (directions == ScrollDirection.forward) {
                  scrollNotifier.value = 2;
                  print('no object');
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: [
                      MainBanner(),
                      Header(
                        head: 'Released in the Past Year',
                      ),
                      ScrollBanners(width: width),
                      Header(head: "Trending Now"),
                      ScrollBanners(width: width),
                      Header(head: 'Top 10 Tv Shows in India Today'),
                      NumberBanners(width: width),
                      kheight,
                      ScrollBanners(width: width)
                    ],
                  ),
                  if (scrollNotifier.value == 2)
                    TopContainer()
                  else if (scrollNotifier.value == 1)
                    kheight
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 5),
      width: double.infinity,
      height: 105,
      color: Colors.black.withOpacity(0.2),
      child: Column(
        children: [
          kheight,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    netflix,
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
            ),
          ),
          kheight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'TV Shows',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text('Movies', style: TextStyle(fontWeight: FontWeight.w600)),
              Text('Categories', style: TextStyle(fontWeight: FontWeight.w600))
            ],
          )
        ],
      ),
    );
  }
}

class MainBanner extends StatelessWidget {
  const MainBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image2), fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeButtons(
                icon: Icons.add,
                text: 'My List',
              ),
              TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kwhite)),
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow,
                    color: kblack,
                  ),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Text(
                      'Play',
                      style: TextStyle(color: kblack),
                    ),
                  )),
              HomeButtons(icon: Icons.info, text: 'Info')
            ],
          ),
        )
      ],
    );
  }
}

class HomeButtons extends StatelessWidget {
  const HomeButtons({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhite,
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.head,
  }) : super(key: key);
  final String head;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(
            head,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class ScrollBanners extends StatelessWidget {
  const ScrollBanners({
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
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width * 0.3,
              height: width * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(image1))),
            ),
          ),
        ),
      ),
    );
  }
}
