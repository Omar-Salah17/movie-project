// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:movies_app/constants.dart';
import 'package:movies_app/features/home/presentation/view/movie_details.dart';

class CustomImageWidgetItem extends StatelessWidget {
  const CustomImageWidgetItem({
    Key? key,
    required this.height,
    required this.width,
    required this.url,
    required this.id,
  }) : super(key: key);
  final double height;
  final double width;
  final String? url;
  final int id;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(id: id),
          ),
        );
        // print(id);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 4),
        height: height,
        width: width,
        child: Stack(
          children: [
            Container(
              height: 150,
              // width: 120,
              margin: const EdgeInsets.only(right: 14),
              child: CachedNetworkImage(
                width: width,
                imageUrl: '$imageUrl$url',
                fit: BoxFit.cover,
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.bookmark,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
