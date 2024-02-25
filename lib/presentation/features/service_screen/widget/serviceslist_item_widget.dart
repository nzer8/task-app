import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/presentation/resources/assets_manger.dart';
import 'package:task/presentation/resources/color_manager.dart';
import 'package:task/presentation/resources/string_manager.dart';
import 'package:task/presentation/resources/style.dart';
import 'package:task/presentation/widgets/custom_image_view.dart';

import '../../../../domain/service_item.dart';

class ServicesListItemWidget extends StatefulWidget {
  final String serviceName;
  final String imagePath;

  // Add required parameters to the constructor
  ServicesListItemWidget({
    Key? key,
    required this.serviceName,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<ServicesListItemWidget> createState() => _ServicesListItemWidgetState();
}

class _ServicesListItemWidgetState extends State<ServicesListItemWidget> {
  bool switchValue = false;
  int selectedIndex = 0; // 0: headPhone, 1: charger, 2: powerbank
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite; // Toggle the favorite status
        });
      },
      child: Container(
        height: 172,
        width: 364,
        decoration: BoxDecoration(
          color: ColorManger.white,
          borderRadius: BorderRadius.circular(
            18,
          ),
          border: Border.all(
            color: ColorManger.yellow,
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CustomImageView(
                imagePath: widget.imagePath, // Use the widget property
              ),
            ),
            const SizedBox(
              width: 23,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        widget.serviceName, // Use the widget property
                        style: Styles.textStyle11,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 26.0, left: 10, right: 15),
                      child: Icon(
                        Icons.share_outlined,
                        size: 17,
                        color: ColorManger.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14.0),
                      child: Column(
                        children: [
                          Icon(
                            isFavorite ? Icons.favorite_border : Icons.favorite,
                            size: 17,
                            color: ColorManger.red,
                          ),
                          Text(
                            '2',
                            style: Styles.textStyle10
                                .copyWith(color: ColorManger.lightGrey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    AppString.price,
                    style: Styles.textStyle15,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    children: [
                      Text(
                        AppString.unActive,
                        style: Styles.textStyle10.copyWith(
                          color: ColorManger.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        height: 30,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Switch.adaptive(
                            trackOutlineColor: MaterialStateProperty.all(
                                ColorManger.lightGrey),
                            trackOutlineWidth: MaterialStateProperty.all(1),
                            splashRadius: 50,
                            activeColor: ColorManger.primaryColor,
                            activeTrackColor: ColorManger.bottomBar,
                            value: switchValue,
                            onChanged: (value) {
                              setState(() {
                                switchValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Text(
                        AppString.active,
                        style: Styles.textStyle10.copyWith(
                          color: ColorManger.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
