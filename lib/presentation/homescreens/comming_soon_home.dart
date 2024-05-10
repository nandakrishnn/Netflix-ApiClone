import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/application/model/movie_model.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/homescreens/video_widget.dart';

class CommingSoonWidget extends StatefulWidget {
  final Movie upcomming;

  CommingSoonWidget({
    super.key,
    required this.upcomming,
  });

  @override
  State<CommingSoonWidget> createState() => _CommingSoonWidgetState();
}

class _CommingSoonWidgetState extends State<CommingSoonWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
         Container(
          
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "FEB",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                '11',
                style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 5,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            width: size.width - 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 VideoWidget(mainimage: widget.upcomming.imagePath,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.upcomming.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 24,
                            letterSpacing: -3,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Column(
                          children: [
                            kheight,
                            Icon(
                              Icons.alarm_add_outlined,
                              color: Colors.white,
                              size: 29,
                            ),
                            Text(
                              'Remind Me',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            kheight,
                            Icon(
                              Icons.info,
                              color: Colors.white,
                              size: 29,
                            ),
                            Text(
                              'Info',
                              style: TextStyle(fontSize: 12),
                            ),
                            kwidth
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Text(widget.upcomming.releasedate!),
                Row(
                  children: [
                    Image.asset(
                      'assets/netflix-logo-png-hd-116606008027stwkbpdxc-removebg-preview.png',
                      height: 55,
                      width: 55,
                    ),
                    kheight,
                    const Center(
                        child: const Text(
                      'FILIM',
                      style: TextStyle(letterSpacing: 4),
                    ))
                  ],
                ),
                Text(
                  widget.upcomming.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.upcomming.overview,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
