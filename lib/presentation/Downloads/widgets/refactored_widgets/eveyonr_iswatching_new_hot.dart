
import 'package:flutter/material.dart';
import 'package:netflix/application/model/movie_model.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/homescreens/second_video.dart';


class EveryonewatchingWidget extends StatelessWidget {
  final Movie everyone;
  const EveryonewatchingWidget({
    super.key, required this.everyone,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight,
          Text(
           everyone.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          kheight,
          Text(
            everyone.overview,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 50,
          ),
          VideoWidget2(imageeveryone: everyone.imagePath,),
          kheight,
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 22,
                  ),
                  Text(
                    "Share",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 7,
              ),
              Column(
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 22,
                  ),
                  Text(
                    "My List",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 7,
              ),
              Column(
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 22,
                  ),
                  Text(
                    "Play",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 7,
              ),
            ],
          )
        ],
      ),
    );
  }
}
