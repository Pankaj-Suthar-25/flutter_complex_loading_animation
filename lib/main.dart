import 'package:flutter/material.dart';

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
      home: InteractiveLoadingAnimation(),
    );
  }
}

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({super.key});

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loading Animation'), centerTitle: true),
      body: Center(
        child: ScaleTransition(
          scale: _controller,
          child: const FlutterLogo(size: 100),
        ),
      ),
    );
  }
}

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
