import 'package:flutter/material.dart';
import 'navigationBars/CustomBottomNavBar.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFF5F5F5),
      body: Center(
        // child: Text("Page $_selectedIndex"),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle FAB Action
        },
        backgroundColor: Colors.teal,
        shape: const CircleBorder(), // Ensures circular shape
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
    );
  }
}
