import 'package:flutter/material.dart';

class EnhancedLoadingAnimation extends StatefulWidget {
  final Duration animationDuration;
  final Color logoColor;

  const EnhancedLoadingAnimation({
    super.key,
    this.animationDuration = const Duration(seconds: 2),
    this.logoColor = Colors.red,
  });

  @override
  State<EnhancedLoadingAnimation> createState() =>
      _EnhancedLoadingAnimationState();
}

class _EnhancedLoadingAnimationState extends State<EnhancedLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..repeat();
    _rotationAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Enhanced Loading Animation'), centerTitle: true),
      body: Center(
        child: Semantics(
          label: 'Loading animation',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: _rotationAnimation,
                child: FlutterLogo(
                  size: screenWidth * 0.2,
                  textColor: widget.logoColor,
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
