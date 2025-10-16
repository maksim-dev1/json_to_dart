import 'package:flutter/material.dart';
import 'package:json_to_dart/futures/json_to_dart/domain/enities/filter_config.dart';

class FilterDialog extends StatefulWidget {
  final FilterConfig initialFilters;
  final void Function(FilterConfig) onApply;

  const FilterDialog({required this.initialFilters, required this.onApply});

  @override
  State<FilterDialog> createState() => FilterDialogState();
}

class FilterDialogState extends State<FilterDialog> {
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
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      title: const Text('Generation Settings', style: TextStyle(color: Colors.white)),
      content: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Freezed
              _CustomSwitchListTile(
                title: 'Use Freezed',
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

              // Serialization
              _CustomSwitchListTile(
                title: 'Use Serialization',
                value: _useSerialization,
                onChanged: (value) => setState(() => _useSerialization = value),
              ),

              // Suffixes
              _CustomSwitchListTile(
                title: 'DTO Suffix',
                value: _isDto,
                onChanged: (value) {
                  setState(() {
                    _isDto = value;
                    if (value) _isEntity = false;
                  });
                },
              ),
              _CustomSwitchListTile(
                title: 'Entity Suffix',
                value: _isEntity,
                onChanged: (value) {
                  setState(() {
                    _isEntity = value;
                    if (value) _isDto = false;
                  });
                },
              ),

              // Basic options
              _CustomSwitchListTile(
                title: 'Add Imports',
                value: _imports,
                onChanged: (value) => setState(() => _imports = value),
              ),

              // Final Fields
              _CustomSwitchListTile(
                title: 'Final Fields',
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

              // Helper methods
              _CustomSwitchListTile(
                title: 'Generate toString',
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
              _CustomSwitchListTile(
                title: 'Generate copyWith',
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
              _CustomSwitchListTile(
                title: 'Generate Equality',
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

              // Documentation
              _CustomSwitchListTile(
                title: 'Generate Documentation',
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
          child: const Text('Cancel', style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 30, 144, 255)),
          ),
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
          child: const Text('Apply', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

class _CustomSwitchListTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool value) onChanged;
  const _CustomSwitchListTile({required this.title, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      value: value,
      onChanged: onChanged,
      trackColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const Color.fromARGB(255, 30, 144, 255);
        }
        return const Color.fromARGB(255, 18, 18, 18);
      }),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      thumbColor: WidgetStateProperty.all(Colors.white),
    );
  }
}
