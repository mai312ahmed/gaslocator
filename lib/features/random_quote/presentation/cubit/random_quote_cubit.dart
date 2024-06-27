import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaslocator/features/random_quote/domain/repositories/quote_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/quote.dart';
part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final QuoteRepository getRandomQuoteUseCase;
  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());

  Future<void> getRandomQuote() async {
    emit(RandomQuoteIsLoading());
    Either<Failure, Quote> response =
        await getRandomQuoteUseCase.getRandomQuote();
    emit(response.fold(
        (failure) => RandomQuoteError(msg: _mapFailureToMsg(failure)),
        (quote) => RandomQuoteLoaded(quote: quote)));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;

      default:
        return AppStrings.unexpectedError;
    }
  }
}
