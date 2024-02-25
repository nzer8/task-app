import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task/presentation/resources/assets_manger.dart';
import 'package:task/presentation/resources/style.dart';

import '../../../widgets/custom_image_view.dart';

// ignore: must_be_immutable
class FortyItemWidget extends StatelessWidget {
  FortyItemWidget({Key? key})
      : super(
          key: key,
        );
  final List<String> imagePaths = [
    ImageAssets.makeUp,
    ImageAssets.cleaners,
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 151,
        //margin: const EdgeInsets.only(left: 55),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return CustomImageView(
                  imagePath: imagePaths[index],
                  height: 151,
                  width: double.infinity,
                  alignment: Alignment.center,
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 7,
                margin: const EdgeInsets.only(bottom: 7),
                child: const AnimatedSmoothIndicator(
                  activeIndex: 0,
                  count: 4,
                  effect: ScrollingDotsEffect(
                    spacing: 16,
                    activeDotColor: Color(0XFFDD6D21),
                    dotColor: Color(0XFFEBD5C1),
                    dotHeight: 7,
                    dotWidth: 9,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
