import 'package:flutter/material.dart';

class AnimatedDot extends StatelessWidget {
  const AnimatedDot({
    super.key,
    this.isActive = false,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 30 : 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
