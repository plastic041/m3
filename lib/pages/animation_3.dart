import 'dart:math';

import 'package:flutter/material.dart';

class Animation3Page extends StatelessWidget {
  const Animation3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Anim3(),
    );
  }
}

class Anim3 extends StatefulWidget {
  const Anim3({super.key});

  @override
  State<Anim3> createState() => _Anim3State();
}

class _Anim3State extends State<Anim3> {
  double _dx = 0.0;
  double _dy = 0.0;

  double _rotateX = 0.0;
  double _rotateY = 0.0;

  final double _radiusSquared = 0.5 * 0.5;

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
            _dx = 0.5 * cos(angle);
            _dy = 0.5 * sin(angle);
          }

          _rotateX = _dy;
          _rotateY = _dx;
        });
      },
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(_rotateX)
          ..rotateY(_rotateY),
        alignment: Alignment.center,
        child: Container(
          color: Colors.green,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}

double invLerp(double value, double min, double max) {
  return (value - min) / (max - min);
}
