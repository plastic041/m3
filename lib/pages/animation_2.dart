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

  final double _radiusSquared = 0.5 * 0.5;

  Matrix4 _matrix = Matrix4.identity();

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

          _matrix = Matrix4.identity()
            ..setEntry(3, 2, 0.1)
            ..rotateX(_rotateX)
            ..rotateY(_rotateY);

          print("---");
          printMatrix(_matrix);
        });
      },
      onPanEnd: (details) {
        setState(() {
          _dx = 0.0;
          _dy = 0.0;
          _rotateX = 0.0;
          _rotateY = 0.0;
          _matrix = Matrix4.identity()..setEntry(3, 2, 0.1);
        });
        print("end");
        // pretty print _matrix
        printMatrix(_matrix);
      },
      // child: Container(
      //   transform: _matrix,
      //   transformAlignment: Alignment.center,
      //   color: Colors.green,
      //   width: 200,
      //   height: 200,
      // ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        transform: _matrix,
        transformAlignment: Alignment.center,
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

void printMatrix(Matrix4 matrix) {
  print(matrix.row0
      .toString()
      .split(",")
      .map(
        (e) => e.substring(0, min(4, e.length)).padRight(4, "0"),
      )
      .join(" "));
  print(matrix.row1
      .toString()
      .split(",")
      .map(
        (e) => e.substring(0, min(4, e.length)).padRight(4, "0"),
      )
      .join(" "));
  print(matrix.row2
      .toString()
      .split(",")
      .map(
        (e) => e.substring(0, min(4, e.length)).padRight(4, "0"),
      )
      .join(" "));
  print(matrix.row3
      .toString()
      .split(",")
      .map(
        (e) => e.substring(0, min(4, e.length)).padRight(4, "0"),
      )
      .join(" "));
}
