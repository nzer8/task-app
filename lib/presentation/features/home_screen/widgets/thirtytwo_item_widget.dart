import 'package:flutter/material.dart';
import 'package:task/presentation/resources/assets_manger.dart';
import 'package:task/presentation/resources/color_manager.dart';

import '../../../resources/string_manager.dart';
import '../../../resources/style.dart';
import '../../../widgets/custom_image_view.dart';

// ignore: must_be_immutable
class ThirtyTwoItemWidget extends StatelessWidget {
  const ThirtyTwoItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    18,
                  ),
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageAssets.babyGames,
              height: 200,
              fit: BoxFit.fitHeight,
              width: 178,
              radius: BorderRadius.circular(
                21,
              ),
              alignment: Alignment.topCenter,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(left: 3),
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 8,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: ColorManger.white,
                  border: Border(
                    top: BorderSide(
                      color: ColorManger.primaryColor,
                      width: 2,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 34,
                              //bottom: 2,
                            ),
                            child: Text(
                              AppString.babyDull,
                              style: Styles.textStyle12,
                            ),
                          ),
                          Icon(
                            Icons.favorite,
                            color: ColorManger.red,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: ColorManger.red,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            AppString.damas,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
