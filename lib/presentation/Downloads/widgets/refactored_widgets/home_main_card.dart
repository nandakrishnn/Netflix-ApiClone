import 'package:flutter/cupertino.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/Downloads/widgets/refactored_widgets/main_Card.dart';
import 'package:netflix/presentation/Downloads/widgets/refactored_widgets/main_titile.dart';

class Maincardhome extends StatelessWidget {
  const Maincardhome({
    super.key,
    required this.title, required this.movies,
  });
  final String title;
  final List movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kheight,
        LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(movies.length, (index) => MainCard(image: movies[index].imagePath,)),
            )),
      ],
    );
  }
}
