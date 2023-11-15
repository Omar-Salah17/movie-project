import 'package:movies_app/features/home/data/model/movie_details_model.dart';
import 'package:movies_app/features/home/data/model/new_release_model.dart';
import 'package:movies_app/features/home/data/model/popular_response_model.dart';
import 'package:movies_app/features/home/data/model/recomended_model.dart';

abstract class MovieRepo {
  Future<List<MovieModel>> fetchPopularData();
  Future<List<NewReleaseModel>> fetchNewReleaseData();
  Future<List<RecomendedModel>> fetchRecomendedData();
  Future<List<MovieDetailsModel>> fetchMovieDetails({required int id});
  Future<List<RecomendedModel>> fetchSimilarDetails({required int id});
}
