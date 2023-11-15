import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/home/data/repo/movie_repo_implementation.dart';
import 'package:movies_app/features/home/presentation/view%20model/recomended_movie_cubit/recomended_movie_cubit_cubit.dart';
import 'package:shimmer/shimmer.dart';

import 'recomened_list_item.dart';

class RecomendedListView extends StatelessWidget {
  const RecomendedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RecomendedMovieCubit(
              MovieRepoImpl(
                apiManager: ApiManager(dio: Dio()),
              ),
            )..fetchRecommendedData(),
        child: BlocBuilder<RecomendedMovieCubit, RecomendedMovieCubitState>(
          builder: (context, state) {
            if (state is RecommendedMovieLoading) {
              return Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                    baseColor: Colors.white.withOpacity(0.5),
                    highlightColor: Colors.grey.withOpacity(0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 110,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 6, bottom: 4),
                          width: 20,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          width: 40,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        Container(
                          // margin: const EdgeInsets.only(bottom: 4),
                          width: 60,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is RecommendedMovieFailure) {
              return Text(state.errorMessage);
            } else if (state is RecommendedMovieSuccess) {
              return SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.recomendedModel.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => RecomendedListItem(
                      recomendedModel: state.recomendedModel[index]),
                ),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
