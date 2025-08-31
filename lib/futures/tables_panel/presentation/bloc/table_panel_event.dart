part of 'table_panel_bloc.dart';

@freezed
sealed class TablePanelEvent with _$TablePanelEvent {
  const factory TablePanelEvent.started({required CodeLineEditingValue json}) = _Started;
}
