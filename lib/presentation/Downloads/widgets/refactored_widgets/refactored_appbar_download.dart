import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
         Text(title,style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold
        ),),
        const Spacer(),
        const Icon(Icons.cast,color: Colors.white,size: 32,),
        const SizedBox(width: 10,),
        Container(
          width:30,
          height: 30,
          color: Colors.blue,),
          const SizedBox(width: 10,)
      ],
    );
  }
}