part of 'manage_booking_cubit.dart';

sealed class ManageBookingState extends Equatable {
  const ManageBookingState();

  @override
  List<Object> get props => [];
}

final class ManageBookingInitial extends ManageBookingState {}
