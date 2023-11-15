part of 'book_details_cubit.dart';

sealed class BookDetailsState {}

final class BookDetailsInitial extends BookDetailsState {}

final class BookDetailsLoading extends BookDetailsState {}

final class BookDetailsFailure extends BookDetailsState {
  final String error;

  BookDetailsFailure({required this.error});
}

final class BookDetailsSucess extends BookDetailsState {
  final List<MovieDetailsModel> movieDetailsModel;

  BookDetailsSucess({required this.movieDetailsModel});
}

final class MoreLikeThisLoading extends BookDetailsState {}

final class MoreLikeThisFailrue extends BookDetailsState {
  final String error;

  MoreLikeThisFailrue({required this.error});
}

final class MoreLikeThisSuccess extends BookDetailsState {
  final List<RecomendedModel> recomendedModel;

  MoreLikeThisSuccess({required this.recomendedModel});
}
