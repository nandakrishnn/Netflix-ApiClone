
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/presentation/Downloads/widgets/main_page/widegts/search/videoplayer/vide_list_item.dart';

class FastandLaugh extends StatelessWidget {
  const FastandLaugh ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SafeArea(child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(videoPathList.length, (index) {
          return VideoListItem(index: index,videourl: videoPathList[index],);
        }),
      ))
    );
  }
}