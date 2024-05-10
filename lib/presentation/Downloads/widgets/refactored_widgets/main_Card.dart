import 'package:flutter/cupertino.dart';
import 'package:netflix/core/colors.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key, required this.image,
  });
  final String image;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Container(
        width: 160,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
                image: NetworkImage(
                
                   imageBase+image))),
              
      ),
    );
    
  }
}
