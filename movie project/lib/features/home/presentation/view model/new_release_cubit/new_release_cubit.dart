import 'package:bloc/bloc.dart';
import 'package:movies_app/features/home/data/model/new_release_model.dart';
import 'package:movies_app/features/home/data/repo/movie_repo.dart';

part 'new_release_state.dart';

class NewReleaseCubit extends Cubit<NewReleaseState> {
  NewReleaseCubit(this.movieRepo) : super(NewReleaseInitial());

  final MovieRepo movieRepo;

  Future<void> fetchNewReleaseData() async {
    emit(NewReleaseLoading());
    try {
      var response = await movieRepo.fetchNewReleaseData();
      emit(NewReleasSuccess(newRelease: response));
    } catch (error) {
      emit(NewReleaseFailure(error: error.toString()));
    }
  }
}
