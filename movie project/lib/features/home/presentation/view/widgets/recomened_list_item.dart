import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/model/recomended_model.dart';
import 'custom_image_widget.dart';
import 'movie_details_widget.dart';

class RecomendedListItem extends StatelessWidget {
  const RecomendedListItem({
    super.key,
    required this.recomendedModel,
  });
  final RecomendedModel recomendedModel;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageWidgetItem(
            height: 140,
            width: 120,
            url: recomendedModel.posterPath,
            id: recomendedModel.id!,
          ),
          const SizedBox(
            height: 4,
          ),
          MovieDetails(
            recomendedModel: recomendedModel,
          ),
        ],
      ),
    );
  }
}
