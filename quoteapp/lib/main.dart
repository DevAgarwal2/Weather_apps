import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:quoteapp/home_page.dart';
import 'package:quoteapp/screens/loading_screen.dart';
import 'package:quoteapp/screens/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}