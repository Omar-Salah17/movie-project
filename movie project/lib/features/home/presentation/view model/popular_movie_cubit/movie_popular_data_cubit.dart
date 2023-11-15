import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/model/popular_response_model.dart';
import 'package:movies_app/features/home/data/repo/movie_repo.dart';

part 'movie_popular_data_state.dart';

class MoviePopularDataCubit extends Cubit<MoviePopularDataState> {
  MoviePopularDataCubit(this.movieRepo) : super(MoviePopularDataInitial());

  final MovieRepo movieRepo;

  Future<void> fetchPopularData() async {
    emit(MoviePopularLoading());
    try {
      var response = await movieRepo.fetchPopularData();
      emit(MoviePopularSuccess(popularResponse: response));
    } catch (e) {
      emit(MoviePopularFailure(error: e.toString()));
    }
  }
}
