import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_center_state.dart';

class MyCenterCubit extends Cubit<MyCenterState> {
  MyCenterCubit() : super(MyCenterInitial());
}
