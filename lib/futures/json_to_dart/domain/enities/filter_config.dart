import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_config.freezed.dart';

@freezed
sealed class FilterConfig with _$FilterConfig {
  const factory FilterConfig({
    @Default(false) bool isDto,
    @Default(false) bool isEntity,

    @Default(true) bool useSerialization,
    @Default(false) bool useFreezed,

    @Default(true) bool imports,
    @Default(true) bool makeFieldsFinal,

    @Default(false) bool generateToString,
    @Default(false) bool generateCopyWith,
    @Default(false) bool generateEquality,

    @Default(false) bool generateDocumentation,
  }) = _FilterConfig;
}
