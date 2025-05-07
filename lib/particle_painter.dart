import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:sbma_space_booking_mobile_app/particle.dart';

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double animation;

  ParticlePainter({
    required this.particles,
    required this.animation,
  });   

  @override
  void paint(Canvas canva, Size size){
    for (var particle in particles) {
      final paint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;

      final centerX = size.width / 2;
      final centerY = size.height / 2;

      final angle = math.atan2(
        particle.position.dy,
        particle.position.dx,
      );

      final currentDistance = math.sqrt(
        math.pow(particle.position.dx, 2) +
        math.pow(particle.position.dy, 2),
      );

      final x = centerX + 
        math.cos(angle + animation * particle.speed) * currentDistance;

      final y = centerY + 
        math.sin(angle + animation * particle.speed) * currentDistance;

      final pulsateSize = particle.size * (0.8 + 0.4 * math.sin(animation * 5));
      canva.drawCircle(Offset(x, y), pulsateSize, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}