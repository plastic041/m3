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

  double _translateX = 0.0;
  double _translateY = 0.0;

  Curve _curve = Curves.easeOut;
  Duration _duration = const Duration(milliseconds: 100);

  final double _radius = 1;
  late double _radiusSquared;

  double _touchX = 0.0;
  double _touchY = 0.0;

  @override
  void initState() {
    super.initState();
    _radiusSquared = _radius * _radius;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        _curve = Curves.easeOut;
        _duration = const Duration(milliseconds: 100);
      },
      onPanUpdate: (details) {
        setState(() {
          _dx -= details.delta.dx / 100;
          _dy += details.delta.dy / 100;

          // if x^2 + y^2 > 0.5^2, then we are outside the circle
          // so we need to normalize the vector
          if (_dx * _dx + _dy * _dy > _radiusSquared) {
            final double angle = atan2(_dy, _dx);
            _dx = _radius * cos(angle);
            _dy = _radius * sin(angle);
          }

          _rotateX = _dy;
          _rotateY = _dx;

          _translateX = -_dx * 20;
          _translateY = _dy * 20;

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

          _curve = Curves.elasticOut;
          _duration = const Duration(milliseconds: 800);
        });
      },
      child: Stack(
        children: [
          Transform(
            transform: Matrix4.identity()..setEntry(3, 2, 0.002),
            alignment: Alignment.center,
            child: AnimatedContainer(
              curve: _curve,
              duration: _duration,
              transform: Matrix4.identity()
                ..translate(_translateX, _translateY)
                ..rotateX(_rotateX)
                ..rotateY(_rotateY),
              transformAlignment: Alignment.center,
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(_translateX, _translateY),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[400]),
                  width: 200,
                  height: 200,
                ),
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
