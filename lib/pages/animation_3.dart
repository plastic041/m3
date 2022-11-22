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
  double _x = 0.0;

  Duration _duration = const Duration(milliseconds: 500);

  final double _speedMultiplier = 0.5;
  final int sensitivity = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onHorizontalDragStart: (details) {
            setState(() {
              _duration = const Duration(milliseconds: 0);
            });
          },
          onHorizontalDragUpdate: (details) {
            setState(() {
              _dx = details.delta.dx;
              _x += _dx;
            });
          },
          onHorizontalDragEnd: (details) {
            double? velocity = details.primaryVelocity;
            if (velocity == null) {
              return;
            }

            if (velocity > sensitivity || velocity < -sensitivity) {
              setState(() {
                double dx = velocity * _speedMultiplier;

                _dx = dx;
                _x = _x + dx;
              });
            }

            setState(() {
              _duration = const Duration(milliseconds: 500);
            });
          },
          // onHorizontalDragEnd: (details) {
          child: AnimatedContainer(
            curve: Curves.easeOutQuad,
            transform: Matrix4.translationValues(_x, 0.0, 0.0),
            duration: _duration,
            child: Container(
              color: Colors.green,
              width: 200,
              height: 200,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: (() {
            setState(() {
              _x = 0.0;
            });
          }),
          child: const Text("reset"),
        )
      ],
    );
  }
}
