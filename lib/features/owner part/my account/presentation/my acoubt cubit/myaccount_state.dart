part of 'myaccount_cubit.dart';

class MyAccountState extends Equatable {
  const MyAccountState({this.selectedTime});
  final String? selectedTime;

  @override
  List<Object?> get props => [
        selectedTime,
      ];

  MyAccountState copyWith({
    String? selectedTime,
  }) {
    return MyAccountState(selectedTime: selectedTime ?? this.selectedTime);
  }
}

class MyAccountInitial extends MyAccountState {
  const MyAccountInitial() : super();
}
