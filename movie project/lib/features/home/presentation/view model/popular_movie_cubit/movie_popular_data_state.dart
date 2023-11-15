part of 'movie_popular_data_cubit.dart';

@immutable
sealed class MoviePopularDataState {}

final class MoviePopularDataInitial extends MoviePopularDataState {}

final class MoviePopularLoading extends MoviePopularDataState {}

final class MoviePopularSuccess extends MoviePopularDataState {
  final List<MovieModel> popularResponse;

  MoviePopularSuccess({required this.popularResponse});
}

final class MoviePopularFailure extends MoviePopularDataState {
  final String error;

  MoviePopularFailure({required this.error});
}
