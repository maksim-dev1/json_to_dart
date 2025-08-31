import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_to_dart/futures/tables_panel/presentation/bloc/table_panel_bloc.dart';

class TablesPanel extends StatelessWidget {
  const TablesPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TablePanelBloc, TablePanelState>(
      builder: (context, state) {
        print(state);
        switch (state) {
          case Loaded(:final tables):
            return ListView.separated(
              itemBuilder: (context, tableIndex) {
                return SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(12),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, fieldIndex) {
                          return Row(
                            children: [
                              Text(tables.tables[tableIndex].fields[fieldIndex].jsonTitle),
                              SizedBox(width: 10),
                              Text(tables.tables[tableIndex].fields[fieldIndex].title),
                              SizedBox(width: 10),
                              Text(tables.tables[tableIndex].fields[fieldIndex].type),
                              SizedBox(width: 10),
                              Text(
                                tables.tables[tableIndex].fields[fieldIndex].isNullable.toString(),
                              ),
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

          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

// switch (state) {
//       Loaded(:final tables) => ListView.separated(itemBuilder: (context, index) {
        
//       }, separatorBuilder: (context, index) => SizedBox(height: 10), itemCount: tables.length,),
//     },