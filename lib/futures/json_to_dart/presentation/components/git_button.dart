import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/app_box.dart';

class GitButton extends StatelessWidget {
  const GitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        ),
        backgroundColor: const WidgetStatePropertyAll(Colors.black),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      onPressed: () {},
      child: Row(
        children: [
          SvgPicture.asset('logo_github.svg'),
          const WBox(8),
          Text(
            'Open GitHub',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
