import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_to_dart/old_features/home/presentation/bloc/json_bloc.dart';
import 'package:json_to_dart/old_features/home/presentation/view/components/custom_json_editor.dart';
import 'package:json_to_dart/old_features/home/presentation/view/components/custom_text_field.dart';
import 'package:json_to_dart/old_features/home/presentation/view/components/git_button.dart';
import 'package:json_to_dart/old_features/home/presentation/view/components/panels/center_panel_child.dart';
import 'package:json_to_dart/old_features/home/presentation/view/components/panels/left_panel_child.dart';
import 'package:json_to_dart/old_features/home/presentation/view/components/resizable_panels.dart';
import 'package:json_to_dart/old_features/home/presentation/view/components/table_view.dart';
import 'package:json_to_dart/shared/components/app_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => JsonBloc(),
      child: Scaffold(
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
              minWidth: 100,
              defaultWidth: 200,
              child: LeftPanelChild(),
            ),
            Panel(
              backgroundColor: Color.fromARGB(255, 2, 2, 2),
              minWidth: 600,
              defaultWidth: 500, // Центральная панель будет шире
              child: CenterPanelChild(),
            ),
            Panel(
              backgroundColor: Color.fromARGB(255, 18, 18, 18),
              minWidth: 100,
              defaultWidth: 200,
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
      ),
    );
  }
}

class RightPanelChild extends StatelessWidget {
  const RightPanelChild({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
