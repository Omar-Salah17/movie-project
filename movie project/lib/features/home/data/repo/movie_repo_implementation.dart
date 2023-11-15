// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/home/data/model/movie_details_model.dart';
import 'package:movies_app/features/home/data/model/new_release_model.dart';
import 'package:movies_app/features/home/data/model/popular_response_model.dart';
import 'package:movies_app/features/home/data/model/recomended_model.dart';
import 'package:movies_app/features/home/data/repo/movie_repo.dart';

class MovieRepoImpl extends MovieRepo {
  ApiManager apiManager;

  MovieRepoImpl({
    required this.apiManager,
  });

  @override
  Future<List<MovieModel>> fetchPopularData() async {
    List<MovieModel> movieData = [];
    var data = await apiManager.fetchData(endPoints: 'tv/popular');
    for (var item in data['results']) {
      movieData.add(MovieModel.fromJson(item));
    }
    return movieData;
  }

  @override
  Future<List<NewReleaseModel>> fetchNewReleaseData() async {
    List<NewReleaseModel> movieData = [];
    var data = await apiManager.fetchData(endPoints: 'movie/upcoming');
    for (var item in data['results']) {
      movieData.add(NewReleaseModel.fromJson(item));
    }
    return movieData;
  }

  @override
  Future<List<RecomendedModel>> fetchRecomendedData() async {
    List<RecomendedModel> movieData = [];
    var data = await apiManager.fetchData(endPoints: 'movie/top_rated');
    for (var item in data['results']) {
      movieData.add(RecomendedModel.fromJson(item));
    }
    return movieData;
  }

  @override
  Future<List<MovieDetailsModel>> fetchMovieDetails({required int id}) async {
    List<MovieDetailsModel> movieData = [];
    var data = await apiManager.fetchData(endPoints: 'movie/$id');
    // var response = await apiManager.gettt();

    movieData.add(MovieDetailsModel.fromJson(data));

    return movieData;
  }

  @override
  Future<List<RecomendedModel>> fetchSimilarDetails({required int id}) async {
    List<RecomendedModel> movieData = [];
    var data = await apiManager.fetchData(endPoints: 'movie/$id/similar');
    for (var item in data['results']) {
      movieData.add(RecomendedModel.fromJson(item));
    }
    return movieData;
  }
}
