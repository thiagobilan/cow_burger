import 'package:flutter/material.dart';

class CowButton extends StatelessWidget {
  final VoidCallback onPress;
  final String label;
  final double? width;
  final double height;
  final Color? color;

  const CowButton({
    Key? key,
    required this.onPress,
    required this.label,
    this.width,
    this.height = 50,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(), primary: color),
      ),
    );
  }
}
