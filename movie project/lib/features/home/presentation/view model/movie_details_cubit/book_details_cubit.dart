import 'package:bloc/bloc.dart';
import 'package:movies_app/features/home/data/model/movie_details_model.dart';
import 'package:movies_app/features/home/data/model/recomended_model.dart';
import 'package:movies_app/features/home/data/repo/movie_repo.dart';

part 'book_details_state.dart';

class DetailsCubit extends Cubit<BookDetailsState> {
  DetailsCubit(this.movieRepo) : super(BookDetailsInitial());

  final MovieRepo movieRepo;

  Future<void> fetchBookDetailsData({required int id}) async {
    emit(BookDetailsLoading());
    try {
      var response = await movieRepo.fetchMovieDetails(id: id);
      emit(BookDetailsSucess(movieDetailsModel: response));
    } catch (error) {
      emit(BookDetailsFailure(error: error.toString()));
    }
  }

  Future<void> fetchMoreLikeThis({required int id}) async {
    emit(MoreLikeThisLoading());
    try {
      var response = await movieRepo.fetchSimilarDetails(id: id);
      emit(MoreLikeThisSuccess(recomendedModel: response));
    } catch (error) {
      emit(MoreLikeThisFailrue(error: error.toString()));
    }
  }
}
