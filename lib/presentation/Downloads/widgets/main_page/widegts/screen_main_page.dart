import 'package:flutter/material.dart';

import 'package:netflix/presentation/homescreens/bottom_navigationbar.dart';
import 'package:netflix/presentation/homescreens/download_page.dart';
import 'package:netflix/presentation/homescreens/fast_and_laugh.dart';
import 'package:netflix/presentation/homescreens/home_page.dart';
import 'package:netflix/presentation/homescreens/new_and_hot.dart';
import 'package:netflix/presentation/homescreens/search_page.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({super.key});

  final _pages=[
    const Home(),
     NewandHot(),
     FastandLaugh(),
    const Search(),
     Download()
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: SafeArea(
        child: ValueListenableBuilder(valueListenable: indexchangeNotifier, builder: (context, value, _) {
          return _pages[value];
        },),
      ),
      bottomNavigationBar: const BtoomnavigationBar(),
    );
  }
}