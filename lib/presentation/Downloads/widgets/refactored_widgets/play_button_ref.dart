import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustombuttonWidget extends StatelessWidget {
  const CustombuttonWidget({
    super.key, required this.icon, required this.title,
  });
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),color: Colors.white
      ),
      child: TextButton.icon(
          onPressed: () {},
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Colors.white)),
          icon:  Icon(
            icon,
            size: 30,
            color: Colors.black,
          ),
          label:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              title,
              style:
                  const TextStyle(fontSize: 20, color: Colors.black),
            ),
          )),
    );
  }
}
