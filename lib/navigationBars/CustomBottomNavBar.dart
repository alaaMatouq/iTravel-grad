import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      elevation: 10, // Adds shadow effect
      shadowColor: Colors.black.withValues(), // Replaces withValues()
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: ImageIcon(
              AssetImage("assets/Icons(assest)/HomeIcon.png"),
              size: 30,
              color: selectedIndex == 0 ? Colors.teal : Colors.grey,
            ),
            onPressed: () => onItemTapped(0),
          ),
          const SizedBox(width: 40),
          IconButton(
            icon: ImageIcon(
              AssetImage("assets/Icons(assest)/calenderIcon.png"),
              size: 30,
              color: selectedIndex == 1 ? Colors.teal : Colors.grey,
            ),
            onPressed: () => onItemTapped(1),
          ),
          const SizedBox(width: 40), // Space for FloatingActionButton (FAB)
          IconButton(
            icon: ImageIcon(
              AssetImage("assets/Icons(assest)/settingsIcon.png"),
              size: 30,
              color: selectedIndex == 2 ? Colors.teal : Colors.grey,
            ),
            onPressed: () => onItemTapped(2),
          ),
          const SizedBox(width: 40),
          IconButton(
            icon: ImageIcon(
              AssetImage("assets/Icons(assest)/profileIcon.png"),
              size: 30,
              color: selectedIndex == 3 ? Colors.teal : Colors.grey,
            ),
            onPressed: () => onItemTapped(3),
          ),
        ],
      ),
    );
  }
}
