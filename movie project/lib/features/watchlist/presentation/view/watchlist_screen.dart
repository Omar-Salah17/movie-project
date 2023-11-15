import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/styles.dart';

import 'widgets/movie_row_item.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 18.0, top: 30, right: 18.0, bottom: 10.0),
              child: Text(
                'Watchlist',
                style: AppStyle.style16.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const MovieRowItem(isWatchList: true),
          ],
        ),
      ),
    );
  }
}
