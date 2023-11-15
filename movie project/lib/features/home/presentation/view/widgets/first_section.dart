import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/core/utils/dimensions.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/home/data/repo/movie_repo_implementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/view%20model/popular_movie_cubit/movie_popular_data_cubit.dart';
import 'package:shimmer/shimmer.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviePopularDataCubit(
          MovieRepoImpl(apiManager: ApiManager(dio: Dio())))
        ..fetchPopularData(),
      child: BlocBuilder<MoviePopularDataCubit, MoviePopularDataState>(
        builder: (context, state) {
          if (state is MoviePopularFailure) {
            return Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(child: Text(state.error)),
              ],
            );
          } else if (state is MoviePopularLoading) {
            return Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Container(
                      height: Dimensions.heightPercentage(context, 24),
                      width: Dimensions.widthPercentage(context, 100),
                      color: Colors.white.withOpacity(0.3),
                    ),
                    Positioned(
                        top: Dimensions.heightPercentage(context, 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 110,
                              width: 90,
                              margin: const EdgeInsets.only(left: 10),
                              color: Colors.grey.withOpacity(0.6),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      Dimensions.heightPercentage(context, 3)),
                              child: Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 4,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    width: 80,
                                    height: 5,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            );
          } else if (state is MoviePopularSuccess) {
            return Expanded(
                flex: 1,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.popularResponse.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        SizedBox(
                          height: Dimensions.heightPercentage(context, 20),
                          // width: double.infinity,
                          width: Dimensions.widthPercentage(context, 100),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: state
                                        .popularResponse[index].backdropPath ==
                                    null
                                ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1VR5DLe4zNggoVeSMCkOgLfM9JqQBbIhvegrdkuGo&s'
                                : 'https://image.tmdb.org/t/p/w500${state.popularResponse[3].backdropPath}',
                          ),
                        ),
                        Positioned(
                          top: Dimensions.heightPercentage(context, 14),
                          // left: Dimensions.widthPercentage(context, 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // Image.asset(
                              //   '$imagePath/Image.png',
                              // ),
                              SizedBox(
                                height: 140,
                                width: 120,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://image.tmdb.org/t/p/w500${state.popularResponse[3].posterPath}',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              // SizedBox(
                              //   width: Dimensions.widthPercentage(context, 3),
                              // ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: Dimensions.heightPercentage(
                                        context, 3)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Dimensions.widthPercentage(
                                          context, 70),
                                      child: Text(
                                        '${state.popularResponse[index].name}',
                                        overflow: TextOverflow.ellipsis,
                                        style: AppStyle.style16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.heightPercentage(
                                          context, 1),
                                    ),
                                    Text(
                                      '${state.popularResponse[index].firstAirDate}  PG-${state.popularResponse[index].genreIds![index]}  2h 7m',
                                      style: AppStyle.style12,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ));
          }
          return const Center(
            child: Text('HIIII'),
          );
        },
      ),
    );
  }
}
