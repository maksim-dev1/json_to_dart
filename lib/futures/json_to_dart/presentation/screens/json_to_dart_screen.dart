import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_to_dart/futures/json_to_dart/domain/enities/filter_config.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/bloc/json_to_dart_bloc.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/app_box.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/filter_dialog.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/git_button.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/panels/json_panel.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/panels/models_panel.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/components/resizable_panels.dart';

const _accentColor = Color.fromARGB(255, 30, 144, 255);
const _appBarTitle = 'JsonToDart';
const _appBarFontSize = 40.0;
const _gitButtonSpacing = 22.0;
const _panelBackgroundColor = Color.fromARGB(255, 18, 18, 18);

class JsonToDartScreen extends StatelessWidget {
  const JsonToDartScreen({super.key});

  void _showFilterDialog(BuildContext context, FilterConfig currentFilters) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => FilterDialog(
        initialFilters: currentFilters,
        onApply: (newFilters) {
          context.read<JsonToDartBloc>().add(JsonToDartEvent.updateFilters(filters: newFilters));
          Navigator.of(dialogContext).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: ResizablePanels(
        dividerBuilder: (ctx, idx) => const _PanelDivider(),
        panels: const [
          Panel(backgroundColor: _panelBackgroundColor, child: JsonPanel()),
          Panel(backgroundColor: _panelBackgroundColor, child: ModelsPanel()),
        ],
      ),
      floatingActionButton: _FilterButton(
        onPressed: () {
          final state = context.read<JsonToDartBloc>().state;
          final filters = state.filters;
          if (filters != null) {
            _showFilterDialog(context, filters);
          }
        },
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: _accentColor,
      title: const Text(_appBarTitle),
      centerTitle: false,
      titleTextStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontSize: _appBarFontSize,
        fontWeight: FontWeight.w900,
        color: Colors.white,
      ),
      actions: const [GitButton(), WBox(_gitButtonSpacing)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _PanelDivider extends StatelessWidget {
  const _PanelDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: DecoratedBox(
        decoration: BoxDecoration(color: _accentColor, borderRadius: BorderRadius.circular(8)),
        child: const SizedBox(height: 40),
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _FilterButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JsonToDartBloc, JsonToDartState>(
      builder: (context, state) => switch (state) {
        Loading() || Success() || Failure() => FloatingActionButton(
          backgroundColor: _accentColor,
          onPressed: onPressed,
          child: const Icon(Icons.filter_list_rounded, color: Colors.white),
        ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
