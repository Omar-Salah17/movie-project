import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/core/utils/dimensions.dart';

import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/home/data/repo/movie_repo_implementation.dart';
import 'package:movies_app/features/home/presentation/view%20model/new_release_cubit/new_release_cubit.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_image_widget.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewReleaseCubit(MovieRepoImpl(apiManager: ApiManager(dio: Dio())))
            ..fetchNewReleaseData(),
      child: BlocBuilder<NewReleaseCubit, NewReleaseState>(
        builder: (context, state) {
          if (state is NewReleasSuccess) {
            return Expanded(
              child: Container(
                color: kGrey,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.widthPercentage(context, 3),
                    top: Dimensions.heightPercentage(context, 3),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New Releases",
                        style: AppStyle.style16,
                      ),
                      SizedBox(
                        height: Dimensions.heightPercentage(context, 2),
                      ),
                      SizedBox(
                        height: 155,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.newRelease.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              CustomImageWidgetItem(
                            url: state.newRelease[index].backdropPath,
                            height: 100,
                            width: 130,
                            id: state.newRelease[index].id!,
                          ),
                        ),
                      ),
                      // TextButton(
                      //     onPressed: () {
                      //       print(state.newRelease[0].id!);
                      //     },
                      //     child: Text('data'))
                    ],
                  ),
                ),
              ),
            );
          } else if (state is NewReleaseLoading) {
            return SizedBox(
              // color: kGrey,
              width: double.infinity,
              height: Dimensions.heightPercentage(context, 30),
              child: Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.grey,
                child: Container(
                  height: 100,
                  width: 130,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            );
          } else if (state is NewReleaseFailure) {
            return Text(state.error);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
