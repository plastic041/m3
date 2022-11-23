import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/easeOutSine.dart';

class Animation2Page extends StatelessWidget {
  const Animation2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Anim2(),
    );
  }
}

class Anim2 extends StatefulWidget {
  const Anim2({super.key});

  @override
  State<Anim2> createState() => _Anim2State();
}

class _Anim2State extends State<Anim2> {
  double _dx = 0.0;
  double _dy = 0.0;

  double _rotateX = 0.0;
  double _rotateY = 0.0;

  double _translateX = 0.0;
  double _translateY = 0.0;

  Duration _duration = const Duration(milliseconds: 100);

  final double _lengthMultiplier = 200;
  final double _angleMultiplier = 0.6;

  double _touchX = 0.0;
  double _touchY = 0.0;

  late final double _diagonalMax;

  @override
  void initState() {
    super.initState();
    _diagonalMax = sqrt(pow(window.physicalSize.longestSide / 2, 2) +
        pow(window.physicalSize.shortestSide / 2, 2));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        _duration = const Duration(milliseconds: 0);
      },
      onPanUpdate: (details) {
        setState(() {
          _dx -= details.delta.dx;
          _dy += details.delta.dy;

          final double angle = atan2(_dy, _dx);
          double distance = sqrt(_dx * _dx + _dy * _dy);
          double distanceNormalized =
              min(distance, _diagonalMax) / _diagonalMax;
          double distanceEased = easeOutSine(distanceNormalized);
          double x = cos(angle) * distanceEased;
          double y = sin(angle) * distanceEased;

          _rotateX = y * _angleMultiplier;
          _rotateY = x * _angleMultiplier;

          _translateX = -x * _lengthMultiplier;
          _translateY = y * _lengthMultiplier;

          _touchX = details.localPosition.dx;
          _touchY = details.localPosition.dy;
        });
      },
      onPanEnd: (details) {
        setState(() {
          _dx = 0.0;
          _dy = 0.0;
          _rotateX = 0.0;
          _rotateY = 0.0;
          _translateX = 0.0;
          _translateY = 0.0;
          _touchX = 0.0;
          _touchY = 0.0;

          _duration = const Duration(milliseconds: 800);
        });
      },
      child: Stack(
        children: [
          Transform(
            transform: Matrix4.identity()..setEntry(3, 2, 0.002),
            alignment: Alignment.center,
            child: AnimatedContainer(
              curve: Curves.elasticOut,
              duration: _duration,
              transform: Matrix4.identity()
                ..translate(_translateX, _translateY)
                ..rotateX(_rotateX)
                ..rotateY(_rotateY),
              transformAlignment: Alignment.center,
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[400]),
                width: 100,
                height: 100,
              ),
            ),
          ),
          Visibility(
            visible: _touchX != 0.0 && _touchY != 0.0,
            child: Positioned(
              top: _touchY - 10,
              left: _touchX - 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9999),
                  color: Colors.yellow,
                ),
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
