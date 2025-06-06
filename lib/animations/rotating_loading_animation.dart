import 'package:flutter/material.dart';

class RotatingLoadingAnimation extends StatefulWidget {
  const RotatingLoadingAnimation({super.key});

  @override
  State<RotatingLoadingAnimation> createState() =>
      _RotatingLoadingAnimationState();
}

class _RotatingLoadingAnimationState extends State<RotatingLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Rotating Loading Animation'), centerTitle: true),
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: const FlutterLogo(size: 100),
        ),
      ),
    );
  }
}
