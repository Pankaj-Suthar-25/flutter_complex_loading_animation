import 'package:flutter/material.dart';

class ImprovedLoadingAnimation extends StatefulWidget {
  const ImprovedLoadingAnimation({super.key});

  @override
  State<ImprovedLoadingAnimation> createState() =>
      _ImprovedLoadingAnimationState();
}

class _ImprovedLoadingAnimationState extends State<ImprovedLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Improved Loading Animation'), centerTitle: true),
      body: Center(
        child: Semantics(
          label: 'Loading animation',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _animation,
                child: RotationTransition(
                  turns: _animation,
                  child: FlutterLogo(size: screenSize.width * 0.2),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Loading...', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
