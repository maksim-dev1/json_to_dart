import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_to_dart/futures/json_panel/presentation/json_panel.dart';
import 'package:json_to_dart/futures/models_panel/presentation/models_panel.dart';
import 'package:json_to_dart/shared/components/app_box.dart';
import 'package:json_to_dart/shared/components/git_button.dart';
import 'package:json_to_dart/shared/components/resizable_panels.dart';

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
        backgroundColor: const Color.fromARGB(255, 30, 144, 255),
        title: const Text('JsonToDart'),
        centerTitle: false,
        titleTextStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 40,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
        actions: const [GitButton(), WBox(22)],
      ),
      body: ResizablePanels(
        dividerBuilder: (ctx, idx) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: SizedBox(
              height: 40,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 30, 144, 255),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          );
        },
        panels: const [
          Panel(backgroundColor: Color.fromARGB(255, 18, 18, 18), child: JsonPanel()),
          Panel(backgroundColor: Color.fromARGB(255, 18, 18, 18), child: ModelsPanel()),
        ],
      ),
    );
  }
}
