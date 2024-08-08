import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'search_screen.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchScreen()),
                        );
                      },
                      child: Image.asset('assets/search.png', height: 24, width: 24),
                    ),
                    Column(
                      children: [
                        Text("Make home", style: TextStyle(fontSize: 16, color: Colors.grey)),
                        Text("BEAUTIFUL", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Image.asset('assets/cart.png', height: 24, width: 24),
                  ],
                ),
                SizedBox(height: 16),
                Expanded(child: HomeScreen()), // Ensure HomeScreen takes available space
              ],
            ),
          ),
        ],
      ),
    );
  }
}
