import 'package:flutter/material.dart';

class BadgeCart extends StatelessWidget {
  const BadgeCart({super.key, required this.value, required this.child, this.color});
  final String value;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: const EdgeInsets.all(2),
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: color ?? Colors.deepOrange,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
