import 'package:flutter/cupertino.dart';

class titileSearchpage extends StatelessWidget {
  const titileSearchpage({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
