import 'package:apitutoral/home_screen.dart';
import 'package:flutter/material.dart';
import 'Modles/Example_two.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'khan',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
    );
  }
}
