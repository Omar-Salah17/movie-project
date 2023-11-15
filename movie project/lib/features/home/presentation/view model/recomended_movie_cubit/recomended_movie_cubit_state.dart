part of 'recomended_movie_cubit_cubit.dart';

sealed class RecomendedMovieCubitState {}

final class RecomendedMovieCubitInitial extends RecomendedMovieCubitState {}

final class RecommendedMovieLoading extends RecomendedMovieCubitState {}

final class RecommendedMovieSuccess extends RecomendedMovieCubitState {
  final List<RecomendedModel> recomendedModel;

  RecommendedMovieSuccess({required this.recomendedModel});
}

final class RecommendedMovieFailure extends RecomendedMovieCubitState {
  final String errorMessage;

  RecommendedMovieFailure({required this.errorMessage});
}
