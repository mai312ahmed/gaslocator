import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'manage_booking_state.dart';

class ManageBookingCubit extends Cubit<ManageBookingState> {
  ManageBookingCubit() : super(ManageBookingInitial());
}
