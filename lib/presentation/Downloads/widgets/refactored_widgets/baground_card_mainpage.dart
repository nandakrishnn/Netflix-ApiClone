import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/Downloads/widgets/refactored_widgets/play_button_ref.dart';

class Bagroundcard extends StatelessWidget {
  const Bagroundcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(KmainImage))),
        ),
        const Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.add,color: Colors.white,size: 25,),
                    Text("My List",style: TextStyle(fontSize: 18, ),),
                  ],
                ),
                CustombuttonWidget(icon: Icons.play_arrow, title: 'Play'),
                 Column(
                  children: [
                    Icon(Icons.info,color: Colors.white,size: 25,),
                    Text("Info",style: TextStyle(fontSize: 18, ),),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

