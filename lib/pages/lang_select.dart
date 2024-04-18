import 'package:flutter/material.dart';

class LangSelect extends StatefulWidget {
  const LangSelect({super.key});

  @override
  State<LangSelect> createState() => _LangSelectState();
}

class _LangSelectState extends State<LangSelect> {
  String language = 'en';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 128),
            Center(
              child: Text('Select Language'),
            ),
            Center(
              child: Text('Configure your PetID, by selecting app language.\n*If you understand this, you are on the right way*'),
            )
          ],
        ),
      ),
    );
  }
}