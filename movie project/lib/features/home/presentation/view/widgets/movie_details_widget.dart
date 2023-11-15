import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/home/data/model/recomended_model.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
    required this.recomendedModel,
  });
  final RecomendedModel recomendedModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.star,
                size: 16,
                color: kYellow,
              ),
              Text('${recomendedModel.voteAverage}'),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: 120,
            child: Text(
              '${recomendedModel.title}',
              overflow: TextOverflow.ellipsis,
              style: AppStyle.style16.copyWith(fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text('${recomendedModel.releaseDate}  R  1h 59m',
              style: AppStyle.style12.copyWith(fontSize: 10)),
          const SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}
