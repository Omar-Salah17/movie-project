part of 'new_release_cubit.dart';

sealed class NewReleaseState {}

final class NewReleaseInitial extends NewReleaseState {}

final class NewReleaseLoading extends NewReleaseState {}

final class NewReleasSuccess extends NewReleaseState {
  final List<NewReleaseModel> newRelease;

  NewReleasSuccess({required this.newRelease});
}

final class NewReleaseFailure extends NewReleaseState {
  final String error;

  NewReleaseFailure({required this.error});
}
