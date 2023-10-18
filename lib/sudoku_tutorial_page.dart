import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:soduku_app/widgets/custom_appbar.dart';

class SudokuTutorialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: "Sudoku Tutorial"),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orange, Colors.blue],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            children: const [
              Text(
                "How to Play",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                "1. Click on a square and it turns blue.\n"
                "2. Click on a number at the bottom of the screen to assign that number to the selected square.\n"
                "3. You can color a square in three ways:\n"
                "   - White (Standard)\n"
                "   - Yellow (Unsure)\n"
                "   - Green (Definitely correct)\n"
                "4. Press the lightbulb icon to show all incorrect squares.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Sudoku Rules",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                "Sudoku is a logic-based number puzzle. The objective is to fill a 9×9 grid with digits so that each column, each row, and each of the nine 3×3 subgrids that compose the grid contain all of the digits from 1 to 9. Each puzzle has a unique solution and no math is required to solve it. Just pure logic and deduction.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
