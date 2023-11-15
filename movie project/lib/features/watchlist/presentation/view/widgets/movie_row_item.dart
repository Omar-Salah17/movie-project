// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/styles.dart';

class MovieRowItem extends StatelessWidget {
  const MovieRowItem({
    Key? key,
    required this.isWatchList,
  }) : super(key: key);
  final bool isWatchList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 18.0, top: 30, right: 18.0, bottom: 10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 180,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('$imagePath/watchlist.png'),
                      ),
                    ),
                  ),
                  isWatchList
                      ? const Positioned(
                          child: Icon(
                            Icons.bookmark,
                            size: 40,
                            color: Colors.yellow,
                          ),
                        )
                      : Container(),
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alita Battle Angel',
                    style: AppStyle.style16,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '2019',
                    style: AppStyle.style12,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Rosa Salazar, Christoph Waltz',
                    style: AppStyle.style12,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(
            thickness: 2.0,
            color: Color.fromRGBO(112, 112, 112, 1),
          ),
        ],
      ),
    );
  }
}
