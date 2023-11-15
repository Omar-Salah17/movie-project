import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/dimensions.dart';

import 'first_section.dart';
import 'second_section.dart';
import 'third_section.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FirstSection(),
        SizedBox(
          height: Dimensions.heightPercentage(context, 3),
        ),
        const SecondSection(),
        SizedBox(
          height: Dimensions.heightPercentage(context, 2),
        ),
        const ThirdSection(),
        SizedBox(
          height: Dimensions.heightPercentage(context, 2),
        ),
      ],
    );
  }
}
