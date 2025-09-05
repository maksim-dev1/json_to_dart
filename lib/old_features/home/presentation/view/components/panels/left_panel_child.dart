import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_to_dart/old_features/home/presentation/bloc/json_bloc.dart';
import 'package:json_to_dart/old_features/home/presentation/view/components/custom_json_editor.dart';
import 'package:json_to_dart/futures/tables_panel/presentation/components/custom_text_field.dart';

class LeftPanelChild extends StatelessWidget {
  const LeftPanelChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(color: Color(0xFF1E1E1E)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 26),
            child: Wrap(
              spacing: 10,
              runSpacing: 12,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const CustomInputField(
                      backgroundColor: Color(0xFF121212),
                      border: false,
                      initialValue: 'ModelName',
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Type',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const CustomInputField(
                      backgroundColor: Color(0xFF121212),
                      border: false,
                      titleTextStyle: false,
                      enabled: false,
                      initialValue: 'Json',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: CodeEditor(
            initialText: '''
        {
          "name": "Alice",
          "age": 25,
          "isStudent": true,
          "address": {
            "street": "123 Main St",
            "city": "Example City"
          },
          "languages": ["Dart", "JavaScript"]
        }''',
            fontSize: 14,
            backgroundColor: const Color(0xFF1E1E1E),
            gutterBackgroundColor: const Color(0xFF121212),
            gutterTextColor: Colors.grey,
            cursorColor: Colors.blue,
            onChanged: (String value) {
              context.read<JsonBloc>().add(
                JsonEvent.jsonSubmitted(jsonString: value),
              );
            },
          ),
        ),
      ],
    );
  }
}