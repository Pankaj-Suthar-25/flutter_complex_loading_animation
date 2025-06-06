import 'package:flutter/material.dart';

class InteractiveLoadingAnimation extends StatefulWidget {
  const InteractiveLoadingAnimation({super.key});

  @override
  State<InteractiveLoadingAnimation> createState() =>
      _InteractiveLoadingAnimationState();
}

class _InteractiveLoadingAnimationState
    extends State<InteractiveLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  Color _logoColor = Colors.blue;
  bool _isAnimating = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _rotationAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    setState(() {
      _isAnimating = !_isAnimating;
      if (_isAnimating) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
    });
  }

  void _changeColor() {
    setState(() {
      _logoColor = _logoColor == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: _logoColor,
            height: screenSize.width * 0.4,
            width: screenSize.width * 0.4,
            child: Padding(
              padding: EdgeInsets.all(screenSize.width * 0.05),
              child: RotationTransition(
                turns: _rotationAnimation,
                child: FlutterLogo(
                    size: screenSize.width * 0.1, textColor: _logoColor),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _toggleAnimation,
            child: Text(_isAnimating ? 'Stop Animation' : 'Start Animation'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _changeColor,
            child: const Text('Change Color'),
          ),
        ],
      ),
    );
  }
}
