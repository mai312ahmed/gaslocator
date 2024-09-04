import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'direct_sale_state.dart';

class DirectSaleCubit extends Cubit<DirectSaleState> {
  DirectSaleCubit() : super(DirectSaleInitial());
}
