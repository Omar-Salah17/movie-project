import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/dimensions.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/watchlist/presentation/view/widgets/movie_row_item.dart';
import 'widgets/search_field.dart';

class SearchScren extends StatelessWidget {
  const SearchScren({super.key});
  final isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SearchField(),
              isEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        const Icon(
                          Icons.local_movies_rounded,
                          size: 160,
                          color: kGrey,
                        ),
                        SizedBox(
                          height: Dimensions.heightPercentage(context, 1),
                        ),
                        Text(
                          'No movies found',
                          style: AppStyle.style12,
                        ),
                      ],
                    )
                  : const Column(
                      children: [
                        MovieRowItem(isWatchList: false),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
