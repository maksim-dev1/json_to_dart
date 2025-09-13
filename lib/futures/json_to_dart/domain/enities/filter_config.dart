import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_config.freezed.dart';

@freezed
sealed class FilterConfig with _$FilterConfig {
  const factory FilterConfig({
    required bool isDto,
    required bool isEntity,
    required bool useFreezed,
    required bool imports,
    required bool generateToString,
    required bool generateCopyWith,
  }) = _FilterConfig;
}
