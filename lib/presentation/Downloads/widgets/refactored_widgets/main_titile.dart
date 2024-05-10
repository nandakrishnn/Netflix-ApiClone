import 'package:flutter/cupertino.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),
      ),
    );
  }}