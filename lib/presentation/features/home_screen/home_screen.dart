import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task/presentation/features/home_screen/widgets/doctorreviewssection_item_widget.dart';
import 'package:task/presentation/features/home_screen/widgets/forty_item_widget.dart';
import 'package:task/presentation/features/home_screen/widgets/thirtytwo_item_widget.dart';
import 'package:task/presentation/resources/assets_manger.dart';
import 'package:task/presentation/resources/color_manager.dart';

import '../../resources/app_router.dart';
import '../../resources/string_manager.dart';
import '../../resources/style.dart';

import '../../widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  int sliderIndex = 1;
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 28,
                    right: 33,
                  ),
                  child: CustomSearchView(
                    prefix: Icon(
                      Icons.search,
                      color: ColorManger.lightGrey,
                      size: 16,
                    ),
                    controller: searchController,
                    hintText: AppString.hintTextSearch,
                    hintStyle: Styles.textStyle11,
                    suffix: Row(
                      children: [
                        Image.asset(ImageAssets.notification),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: ColorManger.primaryColor,
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: Image.asset(ImageAssets.searchPlus),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                _buildRecentOrdersSection(context),
                const SizedBox(height: 16),
                _buildClientTestimonialsSection(context),
                const SizedBox(height: 15),
                _buildDoctorReviewsSection(context),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 7,
                    margin: const EdgeInsets.only(right: 130),
                    child: AnimatedSmoothIndicator(
                      activeIndex: 0,
                      count: 4,
                      effect: ScrollingDotsEffect(
                        spacing: 16,
                        activeDotColor: ColorManger.primaryColor,
                        dotColor: ColorManger.lightGrey,
                        dotHeight: 7,
                        dotWidth: 9,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                _buildReviewsSection(context),
                const SizedBox(height: 2),
              ],
            ),
          ),
          bottomNavigationBar: _buildBottomBar(context),
        ),
      ),
    );
  }

  // /// Section Widget [first section]
  Widget _buildRecentOrdersSection(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 151,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 151,
                    initialPage: 0,
                    autoPlay: false,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        sliderIndex = index;
                      });
                    },
                  ),
                  itemCount: 2,
                  itemBuilder: (context, index, realIndex) {
                    return FortyItemWidget();
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 7,
                    margin: const EdgeInsets.only(
                      right: 130,
                      bottom: 7,
                    ),
                    child: SmoothPageIndicator(
                      controller: PageController(),
                      count: 5,
                      axisDirection: Axis.horizontal,
                      effect: ScrollingDotsEffect(
                        spacing: 16,
                        activeDotColor:
                            sliderIndex == 0 ? Colors.yellow : Colors.orange,
                        dotColor: Colors.grey,
                        dotHeight: 7,
                        dotWidth: 9,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Second Section
  Widget _buildClientTestimonialsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 28,
        right: 19,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: Text(
              AppString.mostServiceChoose,
              style: Styles.textStyle12.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            AppString.seeAll,
            style: Styles.textStyle12.copyWith(
              decoration: TextDecoration.underline,
              color: ColorManger.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  /// third section
  Widget _buildDoctorReviewsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 190,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (
                context,
                index,
              ) {
                return const SizedBox(
                  width: 5,
                );
              },
              itemCount: 4,
              itemBuilder: (context, index) {
                return DoctorreviewssectionItemWidget();
              },
            ),
          ),
        ),
      ),
    );
  }

  /// forth section

  Widget _buildReviewsSection(BuildContext context) {
    return SizedBox(
      height: 275,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 28,
              right: 19,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Text(
                    AppString.bestOffer,
                    style: Styles.textStyle12.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  AppString.seeAll,
                  style: Styles.textStyle12.copyWith(
                    color: ColorManger.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 190,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (
                      context,
                      index,
                    ) {
                      return const SizedBox(
                        width: 5,
                      );
                    },
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return const ThirtyTwoItemWidget();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //
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
