import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_to_dart/core/parser.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/bloc/json_to_dart_bloc.dart';

class JsonToDartProvider extends StatelessWidget {
  final Widget child;
  const JsonToDartProvider({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JsonToDartBloc>(
      create: (context) => JsonToDartBloc(parserService: JsonParserService()),
      child: child,
    );
  }
}
