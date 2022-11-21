import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Anim(),
    );
  }
}

class Anim extends StatefulWidget {
  const Anim({super.key});

  @override
  State<Anim> createState() => _AnimState();
}

class _AnimState extends State<Anim> {
  double _opacity = 1.0;
  double _hue = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _opacity -= details.delta.dy * 0.01;
          _opacity = _opacity.clamp(0.0, 1.0);

          _hue += details.delta.dx * 0.1;
          _hue = _hue % 360.0;

          // print(details.delta.dx);
          // _opacity = invLerp(details.delta.dx.clamp(0, 200), 0, 200);
        });
      },
      child: Opacity(
        opacity: _opacity,
        child: Container(
          color: HSVColor.fromAHSV(1.0, _hue, 1.0, 1.0).toColor(),
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
