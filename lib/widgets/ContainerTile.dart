import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContainerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const ContainerTile(
      {super.key, required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.white),
          const SizedBox(height: 10),

          // Text label inside the square box.
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ).animate().shake(delay: 1000.ms),
        ],
      ),
    );
  }
}
