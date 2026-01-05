import 'package:flutter/material.dart';
import 'intro_page.dart';

void main() {
  runApp(const ZiarahApp());
}

class ZiarahApp extends StatelessWidget {
  const ZiarahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
    );
  }
}
