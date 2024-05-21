import 'package:flutter/material.dart';
import 'package:flutter_3d_viewer/screens/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '3D View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}