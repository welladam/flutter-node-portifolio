import 'package:flutter/material.dart';
import 'package:flutter_portfolio/theme/color.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index)? onTap;

  const CustomBottomNavigationBar(
      {super.key, required this.selectedIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: shadowLight, spreadRadius: 0, blurRadius: 60),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Courses'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            showUnselectedLabels: true,
            currentIndex: selectedIndex,
            onTap: onTap,
          ),
        ));
  }
}
