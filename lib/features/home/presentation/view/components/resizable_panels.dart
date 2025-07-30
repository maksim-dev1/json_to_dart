import 'package:flutter/material.dart';

/// Виджет‑контейнер панели: задаёт содержимое, цвет фона и минимальную ширину.
class Panel extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double minWidth;

  const Panel({
    super.key,
    required this.child,
    this.backgroundColor = Colors.white,
    this.minWidth = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(color: backgroundColor, child: child);
  }
}

/// Стандартный разделитель (если не передан свой через builder).
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

/// Тип функции‑билдера, создающей разделитель между панелями по индексу.
typedef DividerBuilder = Widget Function(BuildContext context, int index);

/// Универсальный ResizablePanels: принимает список Panel и билдера разделителя.
class ResizablePanels extends StatefulWidget {
  /// Сами панели
  final List<Panel> panels;

  /// Толщина разделителя
  final double dividerThickness;

  /// Функция‑билдер для кастомного разделителя.
  final DividerBuilder? dividerBuilder;

  const ResizablePanels({
    super.key,
    required this.panels,
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
        final totalWidth = constraints.maxWidth - totalDivider;

        // Инициализация ширин при первом запуске или при изменении числа панелей
        if (widths == null || widths!.length != count) {
          final each = totalWidth / count;
          widths = List<double>.filled(count, each);
        }

        // Собираем children для Row
        final List<Widget> row = [];
        for (int i = 0; i < count; i++) {
          // Панель
          row.add(SizedBox(width: widths![i], child: widget.panels[i]));
          // Разделитель (если не последняя)
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
      if (dx == 0) return;

      final int leftStart = dividerIndex;
      final int rightStart = dividerIndex + 1;

      // Тянем вправо: левая панель растёт, правая сторона — сжимается каскадно
      if (dx > 0) {
        double remaining = dx;

        // 1. Попробовать уменьшить все панели справа от разделителя
        for (int i = rightStart; i < widths!.length && remaining > 0; i++) {
          final double available = widths![i] - widget.panels[i].minWidth;
          final double take = remaining.clamp(0, available);
          widths![i] -= take;
          remaining -= take;
        }

        // 2. Увеличить панель слева на всё, что получилось забрать
        widths![leftStart] += (dx - remaining);
      }
      // Тянем влево: правая панель растёт, левая сторона — сжимается каскадно
      else {
        double remaining = -dx;

        // 1. Попробовать уменьшить все панели слева от разделителя
        for (int i = leftStart; i >= 0 && remaining > 0; i--) {
          final double available = widths![i] - widget.panels[i].minWidth;
          final double take = remaining.clamp(0, available);
          widths![i] -= take;
          remaining -= take;
        }

        // 2. Увеличить панель справа на всё, что получилось забрать
        widths![rightStart] += (-dx - remaining);
      }
    });
  }
}

/// Отдельный виджет‑разделитель, который оборачивает переданный через builder или дефолтный.
class _PanelDivider extends StatelessWidget {
  final int index;
  final double thickness;
  final DividerBuilder? builder;
  final void Function(double dx) onDrag;

  const _PanelDivider({
    required this.index,
    required this.thickness,
    this.builder,
    required this.onDrag,
  });

  @override
  Widget build(BuildContext context) {
    final child =
        builder?.call(context, index) ??
        DefaultDividerWidget(thickness: thickness);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onHorizontalDragUpdate: (details) => onDrag(details.delta.dx),
      child: SizedBox(width: thickness, child: child),
    );
  }
}
