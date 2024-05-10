import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/core/colors.dart';

class VideoWidget2 extends StatefulWidget {
final String imageeveryone;
  const VideoWidget2({
    
    super.key, required this.imageeveryone, 
  });

  @override
  State<VideoWidget2> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            imageBase+widget.imageeveryone,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(.5),
              radius: 25,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_off,
                    color: Colors.white,
                  ))),
        )
      ],
    );
  }
}
