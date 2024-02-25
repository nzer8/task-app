import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/presentation/features/service_screen/widget/serviceslist_item_widget.dart';
import 'package:task/presentation/resources/assets_manger.dart';
import 'package:task/presentation/resources/style.dart';

import '../../../domain/service_item.dart';
import '../../resources/app_router.dart';
import '../../resources/color_manager.dart';
import '../../resources/string_manager.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  int selectedIndex = 0;
  final List<ServiceItem> serviceItems = [
    ServiceItem(ImageAssets.headPhone, AppString.headPhone),
    ServiceItem(ImageAssets.charger, AppString.lineCharger),
    ServiceItem(ImageAssets.powerBank, AppString.powerBank),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManger.backGroundColor,
        appBar: AppBar(
          backgroundColor: ColorManger.appBarColor,
          actions: const [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 27),
                _buildRowWithTextAndImages(context),
                const SizedBox(height: 25),
                _buildServicesList(context),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowWithTextAndImages(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 40,
          right: 34,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                AppString.follow,
                style: Styles.textStyle10.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Icon(
              Icons.person_add_alt,
              color: ColorManger.primaryColor,
              size: 14,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 6,
              ),
              child: Text(
                AppString.addService,
                style: Styles.textStyle10.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Icon(
              Icons.add_box_outlined,
              color: ColorManger.primaryColor,
              size: 14,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                AppString.top,
                style: Styles.textStyle20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildServicesList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return const SizedBox(
            height: 11,
          );
        },
        itemCount: serviceItems.length, // Use the length of your list
        itemBuilder: (context, index) {
          // Access the ServiceItem at the current index
          ServiceItem currentItem = serviceItems[index];

          // Pass relevant data to ServicesListItemWidget
          return ServicesListItemWidget(
            imagePath: currentItem.imagePath,
            serviceName: currentItem.serviceName,
          );
        },
      ),
    );
  }

  Widget _buildIconTextPair(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        // Handle navigation or any other logic
        if (index == 0) {
          GoRouter.of(context).pushReplacement(AppRouter.kServiceScreen);
        } else if (index == 1) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        } else if (index == 2) {
          // Handle other indices
        } else if (index == 3) {
          // Handle other indices
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selectedIndex == index
                ? ColorManger.primaryColor
                : ColorManger.white,
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(
              color: selectedIndex == index
                  ? ColorManger.primaryColor
                  : ColorManger.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManger.bottomBar,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: ColorManger.black.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(45, 13, 35, 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIconTextPair(Icons.storefront, AppString.service, 0),
            const SizedBox(width: 41),
            _buildIconTextPair(Icons.home_outlined, AppString.main, 1),
            const SizedBox(width: 41),
            _buildIconTextPair(
                Icons.account_circle_outlined, AppString.myAccount, 2),
            const SizedBox(width: 41),
            _buildIconTextPair(
                Icons.shopping_bag_outlined, AppString.offers, 3),
          ],
        ),
      ),
    );
  }
}
