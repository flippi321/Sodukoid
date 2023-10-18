import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soduku_app/home.dart';
import 'package:soduku_app/provider/language_provider.dart';
import 'package:soduku_app/widgets/custom_appbar.dart';

class SodukuCongratulationsScreen extends StatelessWidget {
  const SodukuCongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: languageProvider.get("success"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orange, Colors.blue],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                languageProvider.get("success2"),
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SudokuHomePage(),
                    ),
                  );
                },
                child: Text(
                  languageProvider.get("backToHome"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
