import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';

class NumberCard extends StatelessWidget {
   NumberCard({super.key, required this.index, required this.url});
  final int index;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(width: 30,height: 150,),
            Padding(
              padding:  EdgeInsets.only(left: 0),
              child: Container(
                width: 150,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                    image:  DecorationImage(
                      fit: BoxFit.cover,
                        image: NetworkImage(
                        
                         imageBase+url))),
                      
              )),
          ],
        ),
        Positioned(
          left: 10,
          bottom: -40,
          child: BorderedText(
            strokeWidth:5.0,
            strokeColor: Colors.white,
            child: Text("${index+1}",style: const TextStyle(fontSize: 120,color: Colors.black,decoration: TextDecoration.none,decorationColor: Colors.white,fontWeight: FontWeight.bold),)))
      ],
    );
  }
}