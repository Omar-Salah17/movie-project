import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/dimensions.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'recomended_list_view.dart';

class ThirdSection extends StatelessWidget {
  const ThirdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: kGrey,
        child: Padding(
          padding: EdgeInsets.only(
            left: Dimensions.widthPercentage(context, 3),
            top: Dimensions.heightPercentage(context, 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recomended",
                style: AppStyle.style16,
              ),
              SizedBox(
                height: Dimensions.heightPercentage(context, 2),
              ),
              const RecomendedListView(),
            ],
          ),
        ),
      ),
    );
  }
}
