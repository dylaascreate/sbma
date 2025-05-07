import 'package:flutter/material.dart';

class Particle {
  Offset position;
  Color color;
  double size;
  double speed;

  Particle({
    required this.position,
    required this.color,
    required this.size,
    required this.speed,
  });
}