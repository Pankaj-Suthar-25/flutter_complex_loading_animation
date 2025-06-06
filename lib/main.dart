import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Complex Loading Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImprovedLoadingAnimation(),
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
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
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
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
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
