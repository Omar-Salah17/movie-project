// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/home/data/model/recomended_model.dart';
import 'package:movies_app/features/home/data/repo/movie_repo_implementation.dart';
import 'package:movies_app/features/home/presentation/view%20model/movie_details_cubit/book_details_cubit.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(
        MovieRepoImpl(
          apiManager: ApiManager(
            dio: Dio(),
          ),
        ),
      )..fetchBookDetailsData(id: id),
      child: BlocBuilder<DetailsCubit, BookDetailsState>(
        builder: (context, state) {
          if (state is BookDetailsSucess) {
            num hour = state.movieDetailsModel[0].runtime! / 60;

            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Text(
                  '${state.movieDetailsModel[0].title}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 240,
                    child: CachedNetworkImage(
                      imageUrl:
                          '$imageUrl${state.movieDetailsModel[0].backdropPath!}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${state.movieDetailsModel[0].title}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${state.movieDetailsModel[0].releaseDate} PG-13 ${double.parse(hour.toStringAsFixed(1))}h',
                          style: const TextStyle(
                            color: Color.fromRGBO(181, 180, 180, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MovieImageContainer(
                              url: '${state.movieDetailsModel[0].posterPath}',
                              id: id,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: List.generate(
                                    state.movieDetailsModel[0].genres!.length,
                                    (index) => CategoryContainerItem(
                                      category:
                                          '${state.movieDetailsModel[0].genres![index].name}',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Text(
                                    '${state.movieDetailsModel[0].overview} ',
                                    style: const TextStyle(
                                      color: Color.fromRGBO(200, 200, 200, 1),
                                      fontSize: 14,
                                    ),
                                    maxLines: 9,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellowAccent,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      '${state.movieDetailsModel[0].voteAverage}',
                                      style: const TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: const Color.fromRGBO(40, 42, 40, 1),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('More Like This'),
                            const SizedBox(
                              height: 6,
                            ),
                            MoreLikeThisListView(id: id),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // to leave a part of screen at the bottom
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          } else if (state is BookDetailsLoading) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          } else if (state is BookDetailsFailure) {
            return Scaffold(body: Center(child: Text(state.error)));
          } else {
            return Scaffold(body: Container());
          }
        },
      ),
    );
  }
}

class MoreLikeThisListView extends StatelessWidget {
  const MoreLikeThisListView({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(MovieRepoImpl(
        apiManager: ApiManager(dio: Dio()),
      ))
        ..fetchMoreLikeThis(id: id),
      child: BlocBuilder<DetailsCubit, BookDetailsState>(
        builder: (context, state) {
          if (state is MoreLikeThisSuccess) {
            return SizedBox(
              width: double.infinity,
              height: 185,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => MoreLikeThisListItem(
                  recomendedModel: state.recomendedModel[index],
                  id: state.recomendedModel[index].id!,
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 8,
                ),
                itemCount: state.recomendedModel.length,
              ),
            );
          } else if (state is MoreLikeThisFailrue) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class MovieImageContainer extends StatelessWidget {
  const MovieImageContainer(
      {Key? key,
      this.width = 150,
      this.height = 220,
      required this.url,
      required this.id})
      : super(key: key);
  final double width;
  final double height;
  final String url;
  final int id;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(id: id),
            ));
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("$imageUrl/$url"), fit: BoxFit.cover),
        ),
        child: const Align(
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.bookmark,
              size: 30,
            )),
      ),
    );
  }
}

class CategoryContainerItem extends StatelessWidget {
  const CategoryContainerItem({Key? key, required this.category})
      : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 35,
      margin: const EdgeInsets.only(right: 8, bottom: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(81, 79, 79, 1),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Center(
        child: Text(
          category,
          style: const TextStyle(
              color: Color.fromRGBO(200, 200, 200, 1), fontSize: 14),
        ),
      ),
    );
  }
}

class MoreLikeThisListItem extends StatelessWidget {
  const MoreLikeThisListItem(
      {Key? key, required this.recomendedModel, required this.id})
      : super(key: key);
  final RecomendedModel recomendedModel;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieImageContainer(
            width: 90,
            height: 120,
            url: recomendedModel.posterPath!,
            id: id,
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '${recomendedModel.voteAverage}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  width: 90,
                  child: Text(
                    '${recomendedModel.title}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                Text(
                  '${recomendedModel.releaseDate}  R  1h 59m',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color.fromRGBO(181, 180, 180, 1),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
