import 'package:flutter/material.dart';

/// Виджет-контейнер панели: задаёт содержимое, цвет фона и минимальную ширину.
class Panel extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double minWidth;
  final double defaultWidth;

  const Panel({
    super.key,
    required this.child,
    this.backgroundColor = Colors.white,
    this.minWidth = 100.0,
    this.defaultWidth = 200.0,
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

/// Тип функции-билдера, создающей разделитель между панелями по индексу.
typedef DividerBuilder = Widget Function(BuildContext context, int index);

/// Универсальный ResizablePanels: принимает список Panel и билдера разделителя.
class ResizablePanels extends StatefulWidget {
  /// Сами панели
  final List<Panel> panels;

  /// Толщина разделителя
  final double dividerThickness;

  /// Функция-билдер для кастомного разделителя.
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
        // Доступная ширина для панелей (без разделителей)
        final rawTotalWidth = constraints.maxWidth - totalDivider;
        final totalWidth = rawTotalWidth.isFinite && rawTotalWidth > 0 ? rawTotalWidth : 0.0;

        // Инициализация ширин при первом запуске или при изменении числа панелей
        if (widths == null || widths!.length != count) {
          widths = widget.panels.map((p) => p.defaultWidth).toList();
        }

        // Сумма минимальных ширин
        final totalMinWidth = widget.panels
            .map((p) => p.minWidth)
            .fold<double>(0.0, (a, b) => a + b);

        // Если суммарный minWidth больше доступной ширины — используем minWidth и включаем прокрутку
        if (totalWidth > 0 && totalMinWidth > totalWidth) {
          widths = widget.panels.map((p) => p.minWidth).toList();

          final List<Widget> row = [];
          for (int i = 0; i < count; i++) {
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

        // Подгоняем текущие widths под totalWidth (если totalWidth определён)
        if (totalWidth > 0) {
          final currentSum = widths!.fold<double>(0.0, (a, b) => a + b);

          if ((currentSum - totalWidth).abs() > 0.5) {
            // 1) масштабируем пропорционально
            final scale = totalWidth / currentSum;
            for (int i = 0; i < widths!.length; i++) {
              widths![i] = widths![i] * scale;
            }

            // 2) гарантируем minWidth и считаем дефицит
            double deficit = 0.0;
            for (int i = 0; i < widths!.length; i++) {
              if (widths![i] < widget.panels[i].minWidth) {
                deficit += widget.panels[i].minWidth - widths![i];
                widths![i] = widget.panels[i].minWidth;
              }
            }

            // 3) если есть дефицит — уменьшаем другие панели пропорционально (но не ниже minWidth)
            if (deficit > 0) {
              final adjustable = <int>[];
              for (int i = 0; i < widths!.length; i++) {
                if (widths![i] > widget.panels[i].minWidth) adjustable.add(i);
              }

              double adjustableSum = adjustable.fold<double>(0.0, (s, idx) => s + widths![idx]);

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

            // 4) устраняем мелкие погрешности — подправим последнюю панель
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

        // Собираем children для Row
        final List<Widget> row = [];
        for (int i = 0; i < count; i++) {
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
        // тянем вправо: пытаемся уменьшить ширину панелей справа, чтобы дать место слева
        double remaining = dx;
        for (int i = rightIndex; i < widths!.length && remaining > 0; i++) {
          final available = widths![i] - widget.panels[i].minWidth;
          final take = remaining.clamp(0, available);
          widths![i] -= take;
          remaining -= take;
        }
        // увеличиваем левую панель на то, что получилось забрать
        widths![leftIndex] = widths![leftIndex] + (dx - remaining);
      } else {
        // тянем влево: пытаемся уменьшить ширину панелей слева, чтобы дать место справа
        double remaining = -dx;
        for (int i = leftIndex; i >= 0 && remaining > 0; i--) {
          final available = widths![i] - widget.panels[i].minWidth;
          final take = remaining.clamp(0, available);
          widths![i] -= take;
          remaining -= take;
        }
        // увеличиваем правую панель на то, что получилось забрать
        widths![rightIndex] = widths![rightIndex] + (-dx - remaining);
      }

      // защита: никогда не уступать ниже minWidth (на всякий случай, повторно проверим)
      for (int i = 0; i < widths!.length; i++) {
        if (widths![i] < widget.panels[i].minWidth) {
          widths![i] = widget.panels[i].minWidth;
        }
      }
    });
  }
}

/// Отдельный виджет-разделитель, который оборачивает переданный через builder или дефолтный.
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
    final child = builder?.call(context, index) ?? DefaultDividerWidget(thickness: thickness);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onHorizontalDragUpdate: (details) => onDrag(details.delta.dx),
      child: SizedBox(width: thickness, child: child),
    );
  }
}
