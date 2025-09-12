import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final bool initialValue;
  final VoidCallback? onTap;

  const CustomCheckBox({required this.initialValue, super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: initialValue
              ? const Color.fromARGB(255, 30, 144, 255)
              : const Color.fromARGB(255, 30, 30, 30),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color.fromARGB(255, 108, 108, 108), width: 0.2),
        ),
        child: initialValue ? const Icon(Icons.check, size: 20, color: Colors.white) : null,
      ),
    );
  }
}
