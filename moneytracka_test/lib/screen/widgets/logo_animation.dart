import 'dart:async';
import 'package:flutter/material.dart';

class LogoAnimation extends StatefulWidget {
  const LogoAnimation({super.key});

  @override
  State<LogoAnimation> createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      // Adjust speed of rotation
      duration: const Duration(milliseconds: 500),
    );

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * 3.1416,
    ).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Timer(const Duration(seconds: 10), () {
          _controller.reset();
          _controller.forward();
        });
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _rotationAnimation,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _rotationAnimation.value,
          child: const FlutterLogo(
            size: 40,
          ),
        );
      },
    );
  }
}
