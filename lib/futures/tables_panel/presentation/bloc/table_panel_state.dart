part of 'table_panel_bloc.dart';

@freezed
sealed class TablePanelState with _$TablePanelState {
  const factory TablePanelState.initial() = _Initial;
  const factory TablePanelState.loading() = Loading;
  const factory TablePanelState.loaded({
    required TablesEntity tables,
  }) = Loaded;
  const factory TablePanelState.error({
    required String message,
  }) = Error;
}
