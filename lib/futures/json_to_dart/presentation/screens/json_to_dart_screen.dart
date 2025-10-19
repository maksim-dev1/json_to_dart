import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_to_dart/futures/json_to_dart/domain/enities/filter_config.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/app_box.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/filter_dialog.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/git_button.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/panels/json_panel.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/panels/models_panel.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/resizable_panels.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/providers/json_to_dart_provider.dart';
import 'package:provider/provider.dart';

class JsonToDartScreen extends StatelessWidget {
  const JsonToDartScreen({super.key});

  void _showFilterDialog(BuildContext context, FilterConfig currentFilters) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return FilterDialog(
          initialFilters: currentFilters,
          onApply: (newFilters) {
            context.read<JsonToDartProvider>().updateFilters(newFilters);
            Navigator.of(dialogContext).pop();
          },
        );
      },
    );
  }

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
      floatingActionButton: Consumer<JsonToDartProvider>(
        builder: (context, provider, _) {
          return FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 30, 144, 255),
            child: const Icon(Icons.filter_list_rounded, color: Colors.white),
            onPressed: () => _showFilterDialog(context, provider.filters),
          );
        },
      ),
    );
  }
}
