import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/presentation/download/core/color.dart';
import 'package:netflix/presentation/download/core/constants.dart';
import 'package:netflix/presentation/download/widgets/app_bar_widget.dart';

class Download extends StatelessWidget {
  Download({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(50), child: AppBarWidget()),
            body: ListView(
              children: [
                kheight2,
                Section1(),
                Section2(width: width),
                Section3(),
              ],
            )),
      ),
    );
  }
}

class Section1 extends StatelessWidget {
  const Section1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.settings,
              color: Colors.white,
            ),
            Text('Smart Downloads'),
          ],
        ),
        kheight2,
        Text(
          'Introducing Downloads for You',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        ),
        kheight,
        Text(
          "We'll download a pesonalised selection of \nmovies and shows for you so there's \nalways something to watch on your \ndevice",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   BlocProvider.of<DownloadsBloc>(context)
    //       .add(const DownloadsEvent.getdownloadsImage());
    // });
    BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getdownloadsImage());
    return BlocBuilder<DownloadsBloc, DownloadsState>(
      builder: (context, state) {
        return Container(
          height: width,
          width: width,
          child: state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Stack(alignment: AlignmentDirectional.center, children: [
                  CircleAvatar(
                    radius: width * 0.35,
                    backgroundColor: Colors.grey,
                  ),
                  MovieBox(
                    x: -15,
                    width: width,
                    margin: EdgeInsets.only(
                      right: width * 0.4,
                    ),
                    images: '$imageAppendUrl${state.downloads![0].posterPath}',
                  ),
                  MovieBox(
                    x: 15,
                    width: width,
                    margin: EdgeInsets.only(left: width * 0.4),
                    images: '$imageAppendUrl${state.downloads![1].posterPath}',
                  ),
                  MovieBox(
                    width: width,
                    margin: EdgeInsets.only(left: 0),
                    images: '$imageAppendUrl${state.downloads![2].posterPath}',
                  ),
                ]),
        );
      },
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: MaterialButton(
            minWidth: double.infinity,
            color: kButtoncolorblue,
            onPressed: () {},
            child: Text(
              'Set Up',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {},
          child: Text(
            'See What You Can Download',
            style: TextStyle(color: kblack, fontWeight: FontWeight.bold),
          ),
          color: kwhite,
        )
      ],
    );
  }
}

class MovieBox extends StatelessWidget {
  const MovieBox({
    Key? key,
    required this.width,
    this.x = 0,
    required this.margin,
    required this.images,
  }) : super(key: key);

  final double width;
  final double x;
  final EdgeInsetsGeometry margin;
  final String images;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: x * pi / 180,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: NetworkImage(images),
              fit: BoxFit.fill,
            )),
        width: width * 0.35,
        height: width * 0.5,
        margin: margin,
      ),
    );
  }
}
