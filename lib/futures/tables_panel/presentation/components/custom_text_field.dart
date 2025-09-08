import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputField extends StatefulWidget {
  final Color backgroundColor;
  final bool border;
  final double? width;
  final String? initialValue;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;      
  final ValueChanged<String>? onFocusLost;   
  final ValueChanged<String>? onSubmitted;    
  final String? hintText;
  final bool titleTextStyle;
  final bool enabled;

  const CustomInputField({
    super.key,
    this.backgroundColor = Colors.white,
    this.border = true,
    this.width,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.onFocusLost,
    this.onSubmitted,
    this.hintText,
    this.titleTextStyle = false,
    this.enabled = true,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late final TextEditingController _internalController;
  late final bool _ownsController;
  late final FocusNode _focusNode;
  String? _lastCommittedValue;

  static const double fixedHeight = 32.0;

  TextEditingController get _controller => widget.controller ?? _internalController;

  @override
  void initState() {
    super.initState();
    _ownsController = widget.controller == null;
    _internalController = widget.controller ?? TextEditingController(text: widget.initialValue ?? '');
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
    _lastCommittedValue = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant CustomInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller == null && !_focusNode.hasFocus) {
      final newText = widget.initialValue ?? '';
      if (_internalController.text != newText) {
        _internalController.text = newText;
      }
    }
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      _commitIfNeeded(widget.onFocusLost);
    }
  }

  void _commitIfNeeded(ValueChanged<String>? callback) {
    final current = _controller.text;
    if (callback == null) return;
    if (_lastCommittedValue != current) {
      _lastCommittedValue = current;
      callback(current);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    if (_ownsController) _internalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = widget.titleTextStyle
        ? Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: GoogleFonts.roboto().fontFamily,
          )
        : Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontFamily: GoogleFonts.firaCode().fontFamily,
          );

    final fontSize = textStyle?.fontSize ?? 14.0;
    final verticalPadding = (fixedHeight - fontSize) / 2.0;

    final field = DecoratedBox(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: widget.border
            ? Border.all(color: const Color.fromARGB(255, 108, 108, 108), width: 0.2)
            : Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(4),
      ),
      child: SizedBox(
        height: fixedHeight,
        child: TextField(
          focusNode: _focusNode,
          controller: _controller,
          enabled: widget.enabled,
          onChanged: widget.onChanged,
          onSubmitted: (value) {
            _commitIfNeeded(widget.onSubmitted);
            _focusNode.unfocus();
          },
          textInputAction: TextInputAction.done,
          style: textStyle,
          cursorHeight: fontSize,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            isDense: true,
            hintText: widget.hintText,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: verticalPadding),
          ),
        ),
      ),
    );

    if (widget.width == null) {
      return SizedBox(width: double.infinity, height: fixedHeight, child: field);
    } else {
      return SizedBox(width: widget.width, height: fixedHeight, child: field);
    }
  }
}
