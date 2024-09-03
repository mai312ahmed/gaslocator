part of 'center_settings_cubit.dart';

class CenterSettingsState extends Equatable {
  const CenterSettingsState({this.selectedTime});
  final String? selectedTime;

  @override
  List<Object?> get props => [
        selectedTime,
      ];

  CenterSettingsState copyWith({
    String? selectedTime,
  }) {
    return CenterSettingsState(selectedTime: selectedTime ?? this.selectedTime);
  }
}

class CenterSettingsInitial extends CenterSettingsState {
  const CenterSettingsInitial() : super();
}
