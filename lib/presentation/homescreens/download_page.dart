import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/Downloads/widgets/refactored_widgets/refactored_appbar_download.dart';

class Download extends StatelessWidget {
  Download({Key? key}) : super(key: key);
  final List imagelist = [
    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/fdZpvODTX5wwkD0ikZNaClE4AoW.jpg"
        "https://image.tmdb.org/t/p/w600_and_h900_bestv2/e1J2oNzSBdou01sUvriVuoYp0pJ.jpg"
        "https://image.tmdb.org/t/p/w600_and_h900_bestv2/H6vke7zGiuLsz4v4RPeReb9rsv.jpg"
  ];

  final _widgetList = [
    const _smartdownloads(),
    const section2(),
    const seaction3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          ),
        ),
        body: ListView.separated(
            itemBuilder: (ctx, index) => _widgetList[index],
            padding: EdgeInsets.all(6),
            separatorBuilder: (ctx, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: _widgetList.length));
  }
}

class _smartdownloads extends StatelessWidget {
  const _smartdownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
        Text("Smart Downloads"),
      ],
    );
  }
}

class downloadWidget extends StatelessWidget {
  const downloadWidget({
    super.key,
    required this.imageurl,
    this.angle = 0,
    required this.margin,
  });

  final String imageurl;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * 0.43,
        height: size.width * .62,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(imageurl), fit: BoxFit.cover)),
      ),
    );
  }
}

class section2 extends StatelessWidget {
  const section2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        const Text(
          "We will download a personalised selection of\nmovies and shows for you , so there's\nalways something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * .4,
                backgroundColor: Colors.grey.withOpacity(.5),
              ),
              const downloadWidget(
                imageurl:
                    'https://image.tmdb.org/t/p/w600_and_h900_bestv2/oSLwJMOOQGAsyJNMi4Y3MO44iAJ.jpg',
                margin: EdgeInsets.only(left: 135, bottom: 24),
                angle: 20,
              ),
              const downloadWidget(
                imageurl:
                    'https://image.tmdb.org/t/p/w600_and_h900_bestv2/H6vke7zGiuLsz4v4RPeReb9rsv.jpg',
                margin: EdgeInsets.only(right: 135, bottom: 24),
                angle: -20,
              ),
              const downloadWidget(
                imageurl:
                    'https://image.tmdb.org/t/p/w600_and_h900_bestv2/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg',
                margin: EdgeInsets.only(left: 0, bottom: 5),
                angle: 0,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class seaction3 extends StatelessWidget {
  const seaction3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: () {},
            color: kbuttoncolor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set up",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: () {},
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "See what you can download",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
