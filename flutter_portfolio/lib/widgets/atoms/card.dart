import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;

  const CustomCard({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 30,
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        child: child);
  }
}
