import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_to_dart/futures/tables_panel/presentation/bloc/table_panel_bloc.dart';
import 'package:json_to_dart/old_features/home/domain/entities/table_entity.dart';
import 'package:json_to_dart/shared/components/app_box.dart';

class TablesPanel extends StatelessWidget {
  const TablesPanel({super.key});

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
          BlocBuilder<TablePanelBloc, TablePanelState>(
            builder: (context, state) {
              switch (state) {
                case Loading():
                  return const Center(child: CircularProgressIndicator());
                case Error(:final message):
                  return ErrorState(error: message);
                case Loaded(:final tables):
                  return LoadedState(tables: tables);
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
          HBox(6),
          SizedBox(
            width: double.infinity,

            height: 36,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 30, 30, 30)),
                overlayColor: WidgetStatePropertyAll(
                  Color.fromARGB(255, 30, 144, 255).withAlpha(50),
                ),
                
                // shape: WidgetStatePropertyAll(OutlinedBorder(side: BorderSide(color: Colors.white))),
              ),
              onPressed: () {},
              child: Icon(Icons.add_sharp, color: Colors.white, size: 24),
            ),
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
    return ListView.separated(
      itemBuilder: (context, tableIndex) {
        // return SizedBox(
        //   width: double.infinity,
        //   child: ElevatedButton(onPressed: () {}, child: Icon(Icons.add_rounded)),
        // );
        return SizedBox(
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsetsGeometry.all(12),
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, fieldIndex) {
                  return Row(
                    children: [
                      Text(tables.tables[tableIndex].fields[fieldIndex].jsonTitle),
                      const SizedBox(width: 10),
                      Text(tables.tables[tableIndex].fields[fieldIndex].title),
                      const SizedBox(width: 10),
                      Text(tables.tables[tableIndex].fields[fieldIndex].type),
                      const SizedBox(width: 10),
                      Text(tables.tables[tableIndex].fields[fieldIndex].isNullable.toString()),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: tables.tables[tableIndex].fields.length,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: tables.tables.length,
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
