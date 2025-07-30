import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final Color backgroundColor;
  final bool border;
  final double width;
  final String? initialValue;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final bool titleTextStyle;
  final bool enabled;

  const CustomInputField({
    super.key,
    this.backgroundColor = Colors.white,
    this.border = true,
    this.width = 156,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.hintText,
    this.titleTextStyle = true,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveController =
        controller ?? TextEditingController(text: initialValue);

    final textStyle = titleTextStyle
        ? Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          )
        : Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white,
          );

    final fontSize = textStyle?.fontSize ?? 14.0;

    final verticalPadding = (32.0 - fontSize) / 2.0;

    return SizedBox(
      width: width,
      height: 32,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border
              ? Border.all(color: Colors.grey.shade400)
              : Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          enabled: enabled,
          controller: effectiveController,
          onChanged: onChanged,
          style: textStyle,
          cursorHeight: fontSize,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: verticalPadding,
            ),
          ),
        ),
      ),
    );
  }
}
