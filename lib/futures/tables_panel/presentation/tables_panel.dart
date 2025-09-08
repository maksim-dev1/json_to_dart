import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_to_dart/futures/tables_panel/presentation/components/custom_text_field.dart';
import 'package:json_to_dart/shared/bloc/json_to_dart_bloc.dart';
import 'package:json_to_dart/shared/components/app_box.dart';
import 'package:json_to_dart/shared/components/custom_check_box.dart';
import 'package:json_to_dart/shared/components/popup_menu.dart';
import 'package:json_to_dart/shared/entities/table_entity.dart';

class TablesPanel extends StatefulWidget {
  const TablesPanel({super.key});

  @override
  State<TablesPanel> createState() => _TablesPanelState();
}

class _TablesPanelState extends State<TablesPanel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Column(
        children: [
          /// Заголовак с названием столбцов в таблицах
          SizedBox(
            width: double.infinity,
            height: 36,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 30, 30, 30),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  children: [
                    Text(
                      'Json title',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      'Title',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      'Type',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      'Null',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Список таблиц
          BlocBuilder<JsonToDartBloc, JsonToDartState>(
            builder: (context, state) {
              switch (state) {
                case Loading():
                  return const Center(child: CircularProgressIndicator());
                case Error(:final message):
                  return ErrorState(error: message);
                case Loaded(:final tables):
                  return Expanded(
                    child: SingleChildScrollView(child: LoadedState(tables: tables)),
                  );
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}

class LoadedState extends StatelessWidget {
  final TablesEntity tables;
  const LoadedState({required this.tables, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HBox(6),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, tableIndex) {
            return SizedBox(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 30, 30, 30),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomInputField(
                            width: 200,
                            backgroundColor: const Color.fromARGB(255, 18, 18, 18),
                            border: false,
                            initialValue: tables.tables[tableIndex].name,
                            titleTextStyle: true,
                            onFocusLost: (value) {
                              context.read<JsonToDartBloc>().add(
                                JsonToDartEvent.updateTableTitle(
                                  title: value,
                                  tableIndex: tableIndex,
                                ),
                              );
                            },
                            onSubmitted: (value) {
                              context.read<JsonToDartBloc>().add(
                                JsonToDartEvent.updateTableTitle(
                                  title: value,
                                  tableIndex: tableIndex,
                                ),
                              );
                            },
                          ),
                          const Spacer(),
                          PopupMenu(
                            onDelete: () {
                              context.read<JsonToDartBloc>().add(
                                JsonToDartEvent.deleteTable(tableIndex: tableIndex),
                              );
                            },
                          ),
                        ],
                      ),
                      const HBox(6),
                      ReorderableListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: tables.tables[tableIndex].fields.length,
                        reverse: true,
                        onReorder: (oldIndex, newIndex) {
                          if (newIndex > oldIndex) newIndex -= 1;
                          context.read<JsonToDartBloc>().add(
                            JsonToDartEvent.reorderField(
                              tableIndex: tableIndex,
                              oldIndex: oldIndex,
                              newIndex: newIndex,
                            ),
                          );
                        },
                        proxyDecorator: (Widget child, int index, Animation<double> animation) {
                          return Material(elevation: 6, color: Colors.transparent, child: child);
                        },
                        itemBuilder: (context, fieldIndex) {
                          final field = tables.tables[tableIndex].fields[fieldIndex];
                          final jsonTitle = field.jsonTitle;
                          final title = field.title;
                          final type = field.type;
                          final isNullable = field.isNullable;

                          return SizedBox(
                            key: ValueKey('field-$tableIndex-$fieldIndex-${jsonTitle}_$title'),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 18, 18, 18),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: Row(
                                  children: [
                                    ReorderableDragStartListener(
                                      index: fieldIndex,
                                      child: const Icon(
                                        Icons.menu_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    const WBox(12),

                                    /// JsonTitle
                                    Expanded(
                                      child: CustomInputField(
                                        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
                                        initialValue: jsonTitle,

                                        onFocusLost: (value) {
                                          context.read<JsonToDartBloc>().add(
                                            JsonToDartEvent.updateField(
                                              tableIndex: tableIndex,
                                              fieldIndex: fieldIndex,
                                              jsonTitle: value,
                                            ),
                                          );
                                        },
                                        onSubmitted: (value) {
                                          context.read<JsonToDartBloc>().add(
                                            JsonToDartEvent.updateField(
                                              tableIndex: tableIndex,
                                              fieldIndex: fieldIndex,
                                              jsonTitle: value,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const WBox(12),

                                    /// Title
                                    Expanded(
                                      child: CustomInputField(
                                        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
                                        initialValue: title,
                                        onFocusLost: (value) {
                                          context.read<JsonToDartBloc>().add(
                                            JsonToDartEvent.updateField(
                                              tableIndex: tableIndex,
                                              fieldIndex: fieldIndex,
                                              title: value,
                                            ),
                                          );
                                        },
                                        onSubmitted: (value) {
                                          context.read<JsonToDartBloc>().add(
                                            JsonToDartEvent.updateField(
                                              tableIndex: tableIndex,
                                              fieldIndex: fieldIndex,
                                              title: value,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const WBox(12),

                                    /// Type
                                    Expanded(
                                      child: CustomInputField(
                                        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
                                        initialValue: type,
                                        onFocusLost: (value) {
                                          context.read<JsonToDartBloc>().add(
                                            JsonToDartEvent.updateField(
                                              tableIndex: tableIndex,
                                              fieldIndex: fieldIndex,
                                              type: value,
                                            ),
                                          );
                                        },
                                        onSubmitted: (value) {
                                          context.read<JsonToDartBloc>().add(
                                            JsonToDartEvent.updateField(
                                              tableIndex: tableIndex,
                                              fieldIndex: fieldIndex,
                                              type: value,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const WBox(12),

                                    /// Nullable
                                    CustomCheckBox(
                                      initialValue: isNullable,
                                      onTap: () {
                                        context.read<JsonToDartBloc>().add(
                                          JsonToDartEvent.updateNullable(
                                            nullable: !isNullable,
                                            tableIndex: tableIndex,
                                            fieldIndex: fieldIndex,
                                          ),
                                        );
                                      },
                                    ),
                                    const WBox(6),
                                    IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        context.read<JsonToDartBloc>().add(
                                          JsonToDartEvent.removeField(
                                            tableIndex: tableIndex,
                                            fieldIndex: fieldIndex,
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.close_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const HBox(6),
                      SizedBox(
                        width: double.infinity,
                        height: 36,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 18, 18, 18),
                            overlayColor: const Color.fromARGB(255, 30, 144, 255).withAlpha(50),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                          onPressed: () {
                            context.read<JsonToDartBloc>().add(
                              JsonToDartEvent.addField(tableIndex: tableIndex),
                            );
                          },
                          child: const Icon(Icons.add_sharp, color: Colors.white, size: 24),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: tables.tables.length,
        ),
        const HBox(6),

        /// Крнопка добавления таблиц
        Builder(
          builder: (context) {
            if (context.watch<JsonToDartBloc>().state is! Error) {
              return SizedBox(
                width: double.infinity,
                height: 36,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 30, 30, 30),
                    overlayColor: const Color.fromARGB(255, 30, 144, 255).withAlpha(50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  onPressed: () {
                    context.read<JsonToDartBloc>().add(const JsonToDartEvent.addTable());
                  },
                  child: const Icon(Icons.add_sharp, color: Colors.white, size: 24),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        const HBox(6),

      ],
    );
  }
}

class ErrorState extends StatelessWidget {
  final String error;
  const ErrorState({required this.error, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.1),
          border: Border.all(color: Colors.red.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(
              'Invalid JSON Format',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              error.replaceAll('FormatException: ', ''),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red.shade300),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Text(
              'Please check your JSON syntax and try again',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.red.shade200),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
