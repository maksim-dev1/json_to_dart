import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_to_dart/old_features/home/domain/entities/table_entity.dart';
import 'package:json_to_dart/old_features/home/presentation/bloc/json_bloc.dart';
import 'package:json_to_dart/old_features/home/presentation/view/components/table_view.dart';
import 'package:json_to_dart/shared/components/app_box.dart';

class CenterPanelChild extends StatelessWidget {
  const CenterPanelChild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JsonBloc, JsonState>(
      builder: (context, state) {
        switch (state) {
          case Loading():
            return const LoadingView();
          case Success():
            return SuccessView(tables: state.tables.tables);
          case Failure():
            return FailureView(error: state.error);
          default:
            return SizedBox.shrink();
        }
      },
    );
  }
}

class SuccessView extends StatelessWidget {
  final List<TableEntity> tables;
  const SuccessView({super.key, required this.tables});

  void _addTable(BuildContext context) {
    final newTable = TableEntity(
      name: 'NewTable',
      fields: [
        const FieldEntity(
          jsonTitle: 'newField',
          title: 'NewField',
          type: 'String',
          isNullable: false,
        ),
      ],
    );

    final currentState = context.read<JsonBloc>().state;
    if (currentState case Success()) {
      final newTables = List<TableEntity>.from(currentState.tables.tables)
        ..add(newTable);
      context.read<JsonBloc>().add(
        JsonEvent.jsonTablesUpdated(tables: TablesEntity(tables: newTables)),
      );
    }
  }

  void _updateTable(BuildContext context, int index, TableEntity newTable) {
    final currentState = context.read<JsonBloc>().state;
    if (currentState case Success()) {
      final newTables = List<TableEntity>.from(currentState.tables.tables);
      newTables[index] = newTable;
      context.read<JsonBloc>().add(
        JsonEvent.jsonTablesUpdated(tables: TablesEntity(tables: newTables)),
      );
    }
  }

  void _deleteTable(BuildContext context, int index) {
    final currentState = context.read<JsonBloc>().state;
    if (currentState case Success()) {
      final newTables = List<TableEntity>.from(currentState.tables.tables)
        ..removeAt(index);
      context.read<JsonBloc>().add(
        JsonEvent.jsonTablesUpdated(tables: TablesEntity(tables: newTables)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HBox(6),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 30, 30, 30),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Json title',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        WBox(110),
                        Text(
                          'Title',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        WBox(110),
                        Text(
                          'Type',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            WBox(8),
            TextButton.icon(
              icon: Icon(Icons.add, color: Colors.white),
              label: Text('Add Table', style: TextStyle(color: Colors.white)),
              onPressed: () => _addTable(context),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF121212),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
            ),
          ],
        ),
        HBox(6),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return TableView(
                table: tables[index],
                onTableChanged: (newTable) =>
                    _updateTable(context, index, newTable),
                onDeleteTable: () => _deleteTable(context, index),
              );
            },
            separatorBuilder: (context, index) {
              return HBox(12);
            },
            itemCount: tables.length,
          ),
        ),
      ],
    );
  }
}

class FailureView extends StatelessWidget {
  final String error;
  const FailureView({super.key, required this.error});

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
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              error.replaceAll('FormatException: ', ''),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.red.shade300),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Text(
              'Please check your JSON syntax and try again',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.red.shade200),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Color.fromARGB(255, 30, 144, 255),
      ),
    );
  }
}
