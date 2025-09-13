import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_to_dart/futures/json_to_dart/domain/enities/filter_config.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/bloc/json_to_dart_bloc.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/app_box.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/git_button.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/panels/json_panel.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/panels/models_panel.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/resizable_panels.dart';

class JsonToDartScreen extends StatefulWidget {
  const JsonToDartScreen({super.key});

  @override
  State<JsonToDartScreen> createState() => _JsonToDartScreenState();
}

class _JsonToDartScreenState extends State<JsonToDartScreen> {
  FilterConfig? _filters;
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
      floatingActionButton: BlocListener<JsonToDartBloc, JsonToDartState>(
        listener: (context, state) {
          if (state is Loaded) {
            _filters = state.filters;
          }
        },
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 30, 144, 255),
          child: const Icon(Icons.filter_list_rounded, color: Colors.white),
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (context) {
                _filters ??= const FilterConfig(
                  isDto: false,
                  isEntity: false,
                  useFreezed: false,
                  imports: false,
                  generateToString: false,
                  generateCopyWith: false,
                );
                return FilterDialog(
                  isDto: _filters!.isDto,
                  isEntity: _filters!.isEntity,
                  useFreezed: _filters!.useFreezed,
                  imports: _filters!.imports,
                  generateToString: _filters!.generateToString,
                  generateCopyWith: _filters!.generateCopyWith,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class FilterDialog extends StatelessWidget {
  final bool isDto;
  final void Function(bool)? onChangedIsDto;
  final bool isEntity;
  final void Function(bool)? onChangedIsEntity;

  final bool useFreezed;
  final bool imports;
  final bool generateToString;
  final bool generateCopyWith;

  const FilterDialog({
    required this.isDto,
    required this.isEntity,
    required this.useFreezed,
    required this.imports,
    required this.generateToString,
    required this.generateCopyWith,
    super.key,
    this.onChangedIsDto,
    this.onChangedIsEntity,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filter'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchListTile(title: const Text('DTO'), value: isDto, onChanged: onChangedIsDto),
          SwitchListTile(
            title: const Text('Entity'),
            value: isEntity,
            onChanged: onChangedIsEntity,
          ),
        ],
      ),
    );
  }
}
