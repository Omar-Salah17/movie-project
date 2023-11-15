import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/styles.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

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
                'Browse Category ',
                style: AppStyle.style16.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(),
                      child: Container(
                        width: 180,
                        height: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              '$imagePath/browse.png',
                            ),
                          ),
                        ),
                        child: Center(
                            child: Text(
                          'Action',
                          style: AppStyle.style16,
                        )),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
