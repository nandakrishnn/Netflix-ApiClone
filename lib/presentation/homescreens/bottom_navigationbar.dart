import 'package:flutter/material.dart';


ValueNotifier<int>indexchangeNotifier=ValueNotifier(0);
class BtoomnavigationBar extends StatelessWidget {
  const BtoomnavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: indexchangeNotifier, builder: (context, int newindex, _) {
     return  BottomNavigationBar(
      currentIndex: newindex,
      elevation: 0,
      onTap: (value) {
        indexchangeNotifier.value=value;
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: const IconThemeData(color:Colors.white),
      unselectedIconTheme:const IconThemeData(color: Colors.grey),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
             BottomNavigationBarItem(icon: Icon(Icons.collections),label: 'New & Hot'),
                BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions),label: 'Fast Laughs'),
                   BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
                      BottomNavigationBarItem(icon: Icon(Icons.download),label: 'Downloads'),
        ],
    );
      
    }, );
  }
}