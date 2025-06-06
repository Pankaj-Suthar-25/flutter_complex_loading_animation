import 'package:flutter/material.dart';

import 'animations/enhanced_loading_animation.dart';
import 'animations/improved_loading_animation.dart';
import 'animations/interactive_loading_animation.dart';
import 'animations/loading_animation.dart';
import 'animations/rotating_loading_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Complex Loading Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _widgets = [
    const LoadingAnimation(),
    const RotatingLoadingAnimation(),
    const ImprovedLoadingAnimation(),
    const EnhancedLoadingAnimation(),
    const InteractiveLoadingAnimation(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Loading Animations'), centerTitle: true),
      body: _widgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.animation), label: 'Basic'),
          BottomNavigationBarItem(icon: Icon(Icons.sync), label: 'Rotating'),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), label: 'Improved'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Enhanced'),
          BottomNavigationBarItem(
              icon: Icon(Icons.touch_app), label: 'Interactive'),
        ],
      ),
    );
  }
}
