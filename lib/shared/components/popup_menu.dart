import 'package:flutter/material.dart';
import 'package:json_to_dart/shared/components/app_box.dart';

enum _TableMenuAction { edit, delete }

class PopupMenu extends StatelessWidget {
  final VoidCallback onDelete;
  const PopupMenu({required this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: const Color.fromARGB(255, 30, 30, 30),
      icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
      itemBuilder: (BuildContext context) {
        return <PopupMenuItem<_TableMenuAction>>[
           PopupMenuItem<_TableMenuAction>(
            value: _TableMenuAction.delete,
            onTap: onDelete,
            child: const Row(
              children: [
                Icon(Icons.delete, color: Colors.red),
                WBox(6),
                Text('Delete', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ];
      },
    );
  }
}
