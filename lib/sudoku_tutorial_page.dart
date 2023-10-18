import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soduku_app/provider/language_provider.dart';
import 'package:soduku_app/widgets/custom_appbar.dart';

class SudokuTutorialPage extends StatelessWidget {
  const SudokuTutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

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
            children: [
              Text(
                languageProvider.get("howToPlay"),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                languageProvider.get("howToPlay2"),
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                languageProvider.get("sodukuRules"),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                languageProvider.get("sodukuRules2"),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
