import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_to_dart/features/home/presentation/view/components/custom_json_editor.dart';
import 'package:json_to_dart/features/home/presentation/view/components/custom_text_field.dart';
import 'package:json_to_dart/features/home/presentation/view/components/git_button.dart';
import 'package:json_to_dart/features/home/presentation/view/components/resizable_panels.dart';
import 'package:json_to_dart/shared/components/app_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 144, 255),
        title: Text('JsonToDart'),
        centerTitle: false,
        titleTextStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 40,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
        actions: [GitButton(), WBox(22)],
      ),
      body: ResizablePanels(
        panels: [
          Panel(
            backgroundColor: Color.fromARGB(255, 18, 18, 18),
            minWidth: 200,
            child: LeftPanelChild(),
          ),
          Panel(
            backgroundColor: Color.fromARGB(255, 2, 2, 2),
            minWidth: 150,
            child: CenterPanelChild(),
          ),
          Panel(
            backgroundColor: Color.fromARGB(255, 18, 18, 18),
            minWidth: 100,
            child: RightPanelChild(),
          ),
        ],
        dividerThickness: 12,
        dividerBuilder: (ctx, idx) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: SizedBox(
              height: 40,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 30, 144, 255),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

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
              // Handle JSON changes here
              print('JSON changed: $value');
            },
          ),
        ),
      ],
    );
  }
}

class CenterPanelChild extends StatelessWidget {
  const CenterPanelChild({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class RightPanelChild extends StatelessWidget {
  const RightPanelChild({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
