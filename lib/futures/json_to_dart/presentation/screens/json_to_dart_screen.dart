// lib/futures/json_to_dart/presentation/screens/json_to_dart_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_to_dart/futures/json_to_dart/domain/enities/filter_config.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/providers/json_to_dart_provider.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/app_box.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/git_button.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/panels/json_panel.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/panels/models_panel.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/resizable_panels.dart';

class JsonToDartScreen extends StatelessWidget {
  const JsonToDartScreen({super.key});

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

  void _showFilterDialog(BuildContext context, FilterConfig currentFilters) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return _FilterDialog(
          initialFilters: currentFilters,
          onApply: (newFilters) {
            context.read<JsonToDartProvider>().updateFilters(newFilters);
            Navigator.of(dialogContext).pop();
          },
        );
      },
    );
  }
}

class _FilterDialog extends StatefulWidget {
  final FilterConfig initialFilters;
  final void Function(FilterConfig) onApply;

  const _FilterDialog({
    required this.initialFilters,
    required this.onApply,
  });

  @override
  State<_FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<_FilterDialog> {
  late bool _useSerialization;
  late bool _useFreezed;
  late bool _isDto;
  late bool _isEntity;
  late bool _imports;
  late bool _generateToString;
  late bool _generateCopyWith;
  late bool _generateEquality;
  late bool _makeFieldsFinal;
  late bool _generateDocumentation;

  @override
  void initState() {
    super.initState();
    _useSerialization = widget.initialFilters.useSerialization;
    _useFreezed = widget.initialFilters.useFreezed;
    _isDto = widget.initialFilters.isDto;
    _isEntity = widget.initialFilters.isEntity;
    _imports = widget.initialFilters.imports;
    _generateToString = widget.initialFilters.generateToString;
    _generateCopyWith = widget.initialFilters.generateCopyWith;
    _generateEquality = widget.initialFilters.generateEquality;
    _makeFieldsFinal = widget.initialFilters.makeFieldsFinal;
    _generateDocumentation = widget.initialFilters.generateDocumentation;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Generation Settings'),
      content: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Freezed
              SwitchListTile(
                title: const Text('Use Freezed'),
                value: _useFreezed,
                onChanged: (value) {
                  setState(() {
                    _useFreezed = value;
                    if (value) {
                      _generateToString = false;
                      _generateCopyWith = false;
                      _generateEquality = false;
                      _makeFieldsFinal = false;
                    }
                  });
                },
              ),
              
              const Divider(height: 24),
              
              // Serialization
              SwitchListTile(
                title: const Text('Use Serialization'),
                value: _useSerialization,
                onChanged: (value) => setState(() => _useSerialization = value),
              ),
              
              const Divider(height: 24),
              
              // Suffixes
              SwitchListTile(
                title: const Text('DTO Suffix'),
                value: _isDto,
                onChanged: (value) {
                  setState(() {
                    _isDto = value;
                    if (value) _isEntity = false;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Entity Suffix'),
                value: _isEntity,
                onChanged: (value) {
                  setState(() {
                    _isEntity = value;
                    if (value) _isDto = false;
                  });
                },
              ),
              
              const Divider(height: 24),
              
              // Basic options
              SwitchListTile(
                title: const Text('Add Imports'),
                value: _imports,
                onChanged: (value) => setState(() => _imports = value),
              ),
              
              // Final Fields
              SwitchListTile(
                title: const Text('Final Fields'),
                value: _makeFieldsFinal,
                onChanged: (value) {
                  setState(() {
                    _makeFieldsFinal = value;
                    if (value && _useFreezed) {
                      _useFreezed = false;
                    }
                  });
                },
              ),
              
              const Divider(height: 24),
              
              // Helper methods
              SwitchListTile(
                title: const Text('Generate toString'),
                value: _generateToString,
                onChanged: (value) {
                  setState(() {
                    _generateToString = value;
                    if (value && _useFreezed) {
                      _useFreezed = false;
                    }
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Generate copyWith'),
                value: _generateCopyWith,
                onChanged: (value) {
                  setState(() {
                    _generateCopyWith = value;
                    if (value && _useFreezed) {
                      _useFreezed = false;
                    }
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Generate Equality'),
                value: _generateEquality,
                onChanged: (value) {
                  setState(() {
                    _generateEquality = value;
                    if (value && _useFreezed) {
                      _useFreezed = false;
                    }
                  });
                },
              ),
              
              const Divider(height: 24),
              
              // Documentation
              SwitchListTile(
                title: const Text('Generate Documentation'),
                value: _generateDocumentation,
                onChanged: (value) => setState(() => _generateDocumentation = value),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onApply(
              FilterConfig(
                useSerialization: _useSerialization,
                useFreezed: _useFreezed,
                isDto: _isDto,
                isEntity: _isEntity,
                imports: _imports,
                generateToString: _generateToString,
                generateCopyWith: _generateCopyWith,
                generateEquality: _generateEquality,
                makeFieldsFinal: _makeFieldsFinal,
                generateDocumentation: _generateDocumentation,
              ),
            );
          },
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
