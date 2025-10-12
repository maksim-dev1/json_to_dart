// lib/futures/json_to_dart/domain/enities/filter_config.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_config.freezed.dart';

@freezed
sealed class FilterConfig with _$FilterConfig {
  const factory FilterConfig({
    // Суффиксы (взаимоисключающие)
    @Default(false) bool isDto,
    @Default(false) bool isEntity,
    
    // Сериализация
    @Default(true) bool useSerialization,
    @Default(false) bool useFreezed,
    
    // Базовые опции
    @Default(true) bool imports,
    @Default(true) bool makeFieldsFinal,
    
    // Вспомогательные методы (только для ручной сериализации)
    @Default(false) bool generateToString,
    @Default(false) bool generateCopyWith,
    @Default(false) bool generateEquality,
    
    // Документация
    @Default(false) bool generateDocumentation,
  }) = _FilterConfig;
}
