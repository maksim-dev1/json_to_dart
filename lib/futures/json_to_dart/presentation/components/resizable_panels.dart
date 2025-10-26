import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double minWidth;
  final double defaultWidth;

  const Panel({
    required this.child,
    super.key,
    this.backgroundColor = Colors.white,
    this.minWidth = 100.0,
    this.defaultWidth = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: backgroundColor, child: child);
  }
}

class DefaultDividerWidget extends StatelessWidget {
  final double thickness;

  const DefaultDividerWidget({super.key, this.thickness = 12.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: thickness,
      color: Colors.grey.shade200,
      child: const Center(child: Icon(Icons.drag_handle)),
    );
  }
}

typedef DividerBuilder = Widget Function(BuildContext context, int index);

class ResizablePanels extends StatefulWidget {
  final List<Panel> panels;

  final double dividerThickness;

  final DividerBuilder? dividerBuilder;

  const ResizablePanels({
    required this.panels,
    super.key,
    this.dividerThickness = 12.0,
    this.dividerBuilder,
  });

  @override
  State<ResizablePanels> createState() => _ResizablePanelsState();
}

class _ResizablePanelsState extends State<ResizablePanels> {
  List<double>? widths;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final count = widget.panels.length;
        final totalDivider = widget.dividerThickness * (count - 1);
        final rawTotalWidth = constraints.maxWidth - totalDivider;
        final totalWidth = rawTotalWidth.isFinite && rawTotalWidth > 0 ? rawTotalWidth : 0.0;

        if (widths == null || widths!.length != count) {
          widths = widget.panels.map((p) => p.defaultWidth).toList();
        }

        final totalMinWidth = widget.panels
            .map((p) => p.minWidth)
            .fold<double>(0.0, (a, b) => a + b);

        if (totalWidth > 0 && totalMinWidth > totalWidth) {
          widths = widget.panels.map((p) => p.minWidth).toList();

          final row = <Widget>[];
          for (var i = 0; i < count; i++) {
            row.add(SizedBox(width: widths![i], child: widget.panels[i]));
            if (i < count - 1) {
              row.add(
                _PanelDivider(
                  index: i,
                  thickness: widget.dividerThickness,
                  builder: widget.dividerBuilder,
                  onDrag: (dx) => _onDividerDrag(i, dx),
                ),
              );
            }
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: row),
          );
        }

        if (totalWidth > 0) {
          final currentSum = widths!.fold<double>(0.0, (a, b) => a + b);

          if ((currentSum - totalWidth).abs() > 0.5) {
            final scale = totalWidth / currentSum;
            for (var i = 0; i < widths!.length; i++) {
              widths![i] = widths![i] * scale;
            }

            var deficit = 0.0;
            for (var i = 0; i < widths!.length; i++) {
              if (widths![i] < widget.panels[i].minWidth) {
                deficit += widget.panels[i].minWidth - widths![i];
                widths![i] = widget.panels[i].minWidth;
              }
            }

            if (deficit > 0) {
              final adjustable = <int>[];
              for (var i = 0; i < widths!.length; i++) {
                if (widths![i] > widget.panels[i].minWidth) adjustable.add(i);
              }

              final adjustableSum = adjustable.fold<double>(0.0, (s, idx) => s + widths![idx]);

              if (adjustable.isNotEmpty && adjustableSum > 0) {
                for (final idx in adjustable) {
                  final take = (widths![idx] / adjustableSum) * deficit;
                  widths![idx] = (widths![idx] - take).clamp(
                    widget.panels[idx].minWidth,
                    double.infinity,
                  );
                }
              }
            }

            final sumAfter = widths!.fold<double>(0.0, (a, b) => a + b);
            final diff = totalWidth - sumAfter;
            if (diff.abs() > 0.0001) {
              widths![widths!.length - 1] = (widths!.last + diff).clamp(
                widget.panels.last.minWidth,
                double.infinity,
              );
            }
          }
        }

        final row = <Widget>[];
        for (var i = 0; i < count; i++) {
          row.add(SizedBox(width: widths![i], child: widget.panels[i]));
          if (i < count - 1) {
            row.add(
              _PanelDivider(
                index: i,
                thickness: widget.dividerThickness,
                builder: widget.dividerBuilder,
                onDrag: (dx) => _onDividerDrag(i, dx),
              ),
            );
          }
        }

        return Row(children: row);
      },
    );
  }

  void _onDividerDrag(int dividerIndex, double dx) {
    setState(() {
      if (dx == 0 || widths == null) return;

      final leftIndex = dividerIndex;
      final rightIndex = dividerIndex + 1;

      if (dx > 0) {
        var remaining = dx;
        for (var i = rightIndex; i < widths!.length && remaining > 0; i++) {
          final available = widths![i] - widget.panels[i].minWidth;
          final take = remaining.clamp(0, available);
          widths![i] -= take;
          remaining -= take;
        }
        widths![leftIndex] = widths![leftIndex] + (dx - remaining);
      } else {
        var remaining = -dx;
        for (var i = leftIndex; i >= 0 && remaining > 0; i--) {
          final available = widths![i] - widget.panels[i].minWidth;
          final take = remaining.clamp(0, available);
          widths![i] -= take;
          remaining -= take;
        }
        widths![rightIndex] = widths![rightIndex] + (-dx - remaining);
      }

      for (var i = 0; i < widths!.length; i++) {
        if (widths![i] < widget.panels[i].minWidth) {
          widths![i] = widget.panels[i].minWidth;
        }
      }
    });
  }
}

class _PanelDivider extends StatelessWidget {
  final int index;
  final double thickness;
  final DividerBuilder? builder;
  final void Function(double dx) onDrag;

  const _PanelDivider({
    required this.index,
    required this.thickness,
    required this.onDrag,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final child = builder?.call(context, index) ?? DefaultDividerWidget(thickness: thickness);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onHorizontalDragUpdate: (details) => onDrag(details.delta.dx),
      child: SizedBox(width: thickness, child: child),
    );
  }
}
