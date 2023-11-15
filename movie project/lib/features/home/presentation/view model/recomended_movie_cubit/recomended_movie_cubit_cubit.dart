import 'package:bloc/bloc.dart';
import 'package:movies_app/features/home/data/model/recomended_model.dart';
import 'package:movies_app/features/home/data/repo/movie_repo.dart';

part 'recomended_movie_cubit_state.dart';

class RecomendedMovieCubit extends Cubit<RecomendedMovieCubitState> {
  RecomendedMovieCubit(this.movieRepo) : super(RecomendedMovieCubitInitial());

  final MovieRepo movieRepo;

  Future<void> fetchRecommendedData() async {
    emit(RecommendedMovieLoading());
    try {
      var response = await movieRepo.fetchRecomendedData();
      emit(RecommendedMovieSuccess(recomendedModel: response));
    } catch (error) {
      emit(RecommendedMovieFailure(errorMessage: error.toString()));
    }
  }
}
