import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
           label: 'hi',
            icon: Badge(
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
        )),
        BottomNavigationBarItem(label: '',icon: Badge()),
        // BottomNavigationBarItem(icon: Badge())
      ],
    );
  }
}
