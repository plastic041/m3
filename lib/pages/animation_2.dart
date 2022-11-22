import 'dart:math';

import 'package:flutter/material.dart';

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

  Curve _curve = Curves.easeOut;
  Duration _duration = const Duration(milliseconds: 200);

  final double _radiusSquared = 1 * 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _dx -= details.delta.dx / 100;
          _dy += details.delta.dy / 100;

          // if x^2 + y^2 > 0.5^2, then we are outside the circle
          // so we need to normalize the vector
          if (_dx * _dx + _dy * _dy > _radiusSquared) {
            final double angle = atan2(_dy, _dx);
            _dx = 1 * cos(angle);
            _dy = 1 * sin(angle);
          }

          _rotateX = _dy;
          _rotateY = _dx;

          _curve = Curves.easeOut;
          _duration = const Duration(milliseconds: 200);
        });
      },
      onPanEnd: (details) {
        setState(() {
          _dx = 0.0;
          _dy = 0.0;
          _rotateX = 0.0;
          _rotateY = 0.0;

          _curve = Curves.elasticOut;
          _duration = const Duration(milliseconds: 500);
        });
      },
      child: Transform(
        transform: Matrix4.identity()..setEntry(3, 2, 0.002),
        alignment: Alignment.center,
        child: AnimatedContainer(
          curve: _curve,
          duration: _duration,
          transform: Matrix4.identity()
            ..rotateX(_rotateX)
            ..rotateY(_rotateY),
          transformAlignment: Alignment.center,
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
