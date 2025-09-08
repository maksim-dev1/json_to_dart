import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:json_to_dart/shared/entities/table_entity.dart';
import 'package:json_to_dart/futures/tables_panel/presentation/components/custom_text_field.dart';
import 'package:json_to_dart/shared/components/app_box.dart';

const dartTypes = [
  'String',
  'int',
  'double',
  'bool',
  'num',
  'List<dynamic>',
  'List<String>',
  'List<int>',
  'List<double>',
  'List<bool>',
  'Map<String, dynamic>',
  'DateTime',
  'dynamic',
  'Object',
  'Object?',
];

class TableView extends StatefulWidget {
  final TableEntity table;
  final Function(TableEntity) onTableChanged;
  final VoidCallback onDeleteTable;

  const TableView({
    super.key,
    required this.table,
    required this.onTableChanged,
    required this.onDeleteTable,
  });

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  late List<FieldEntity> fields;
  @override
  void initState() {
    super.initState();
    fields = List.from(widget.table.fields);
  }

  void _updateTable() {
    final newTable = TableEntity(name: widget.table.name, fields: fields);
    widget.onTableChanged(newTable);
  }

  void _addField() {
    setState(() {
      fields.add(
        const FieldEntity(
          jsonTitle: 'newField',
          title: 'NewField',
          type: 'String', // Using String as default type
          isNullable: false,
        ),
      );
      _updateTable();
    });
  }

  void _removeField(int index) {
    setState(() {
      fields.removeAt(index);
      _updateTable();
    });
  }

  void _updateField(int index, FieldEntity newField) {
    setState(() {
      fields[index] = newField;
      _updateTable();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 30, 30, 30),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                children: [
                  Expanded(
                    child: CustomInputField(
                      backgroundColor: Color(0xFF121212),
                      initialValue: widget.table.name,
                      titleTextStyle: true,
                      border: false,
                      onChanged: (value) {
                        final newTable = TableEntity(
                          name: value,
                          fields: fields,
                        );
                        widget.onTableChanged(newTable);
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.white),
                    onPressed: widget.onDeleteTable,
                  ),
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final field = fields[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 18, 18, 18),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/menu_outline.svg'),
                            Spacer(),
                            CustomInputField(
                              backgroundColor: Color(0xFF121212),
                              initialValue: field.jsonTitle,
                              onChanged: (value) {
                                _updateField(
                                  index,
                                  field.copyWith(jsonTitle: value),
                                );
                              },
                            ),
                            Spacer(),
                            CustomInputField(
                              backgroundColor: Color(0xFF121212),
                              initialValue: field.title,
                              onChanged: (value) {
                                _updateField(
                                  index,
                                  field.copyWith(title: value),
                                );
                              },
                            ),
                            Spacer(),
                            Container(
                              width: 156,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Color(0xFF121212),
                                border: Border.all(
                                  color: Color.fromARGB(255, 108, 108, 108),
                                  width: 0.2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Builder(
                                builder: (context) {
                                  // Проверяем, есть ли текущий тип в списке
                                  final currentType = field.type;
                                  final List<String> availableTypes = List.from(
                                    dartTypes,
                                  );

                                  // Если текущий тип не в списке, добавляем его
                                  if (!availableTypes.contains(currentType)) {
                                    availableTypes.add(currentType);
                                  }

                                  return DropdownButton<String>(
                                    value: currentType,
                                    isExpanded: true,
                                    dropdownColor: Color(0xFF121212),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                    underline: SizedBox(),
                                    items: availableTypes.map((String type) {
                                      return DropdownMenuItem<String>(
                                        value: type,
                                        child: Text(type),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        _updateField(
                                          index,
                                          field.copyWith(type: newValue),
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 54,
                              height: 54,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Checkbox(
                                  visualDensity: VisualDensity.compact,
                                  value: field.isNullable,
                                  onChanged: (v) {
                                    if (v != null) {
                                      _updateField(
                                        index,
                                        field.copyWith(isNullable: v),
                                      );
                                    }
                                  },
                                  side: BorderSide(
                                    color: Color.fromARGB(255, 108, 108, 108),
                                    width: 0.2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              icon: SvgPicture.asset(
                                'assets/close_outline.svg',
                              ),
                              onPressed: () => _removeField(index),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return HBox(6);
              },
              itemCount: fields.length,
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: TextButton.icon(
                icon: Icon(Icons.add, color: Colors.white),
                label: Text('Add Field', style: TextStyle(color: Colors.white)),
                onPressed: _addField,
                style: TextButton.styleFrom(backgroundColor: Color(0xFF121212)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:json_to_dart/features/home/domain/entities/table_entity.dart';

// class TableView extends StatelessWidget {
//   final TableEntity table;

//   const TableView({super.key, required this.table});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: const Color(0xFF1E1E1E),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               table.name,
//               style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Table(
//               border: TableBorder.all(color: Colors.grey[800]!, width: 1),
//               columnWidths: const {
//                 0: FlexColumnWidth(2), // JSON Name
//                 1: FlexColumnWidth(2), // Model Name
//                 2: FlexColumnWidth(1.5), // Type
//                 3: FlexColumnWidth(1), // Nullable
//               },
//               children: [
//                 TableRow(
//                   decoration: BoxDecoration(color: Colors.grey[850]),
//                   children: [
//                     _buildHeaderCell('JSON Name'),
//                     _buildHeaderCell('Model Name'),
//                     _buildHeaderCell('Type'),
//                     _buildHeaderCell('Nullable'),
//                   ],
//                 ),
//                 ...table.fields.map(
//                   (field) => TableRow(
//                     children: [
//                       _buildCell(field.jsonTitle),
//                       _buildCell(field.title),
//                       _buildCell(field.type),
//                       _buildCell(field.isNullable ? '✓' : ''),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeaderCell(String text) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(
//         text,
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }

//   Widget _buildCell(String text) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(text, style: const TextStyle(color: Colors.white)),
//     );
//   }
// }
