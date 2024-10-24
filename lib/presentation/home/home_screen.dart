import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sizer/sizer.dart';

import '../../constants/app_strings.dart';
import '../../constants/assets_path.dart';
import '../../cubit/food_items_cubit.dart';
import '../../style/colors.dart';

import 'widgets/custom_carousel_indicator_widget.dart';
import 'widgets/custom_carousel_wiget.dart';
import 'widgets/custom_chip_button.dart';
import 'widgets/food_item_cards_list_widget.dart';
import 'widgets/rounded_title_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FoodItemsCubit>(context).getFoodItems();

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        leading: const Icon(Icons.menu_rounded),
        centerTitle: true,
        title: const RoundedTitleWiget(),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: SvgPicture.asset(AssetsPath.searchIcon),
          )
        ],
      ),
      body: BlocConsumer<FoodItemsCubit, FoodItemsState>(
        listener: (context, state) {
          if (state is FoodItemsInitial) {
            print("Init State");
          } else if (state is FoodItemsLoading) {
            print("Loading State");
          } else {
            print("Loaded State");
          }
        },
        builder: (context, state) {
          if (state is FoodItemsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: CustomColors.black,
              ),
            );
          } else if (state is FoodItemsLoadedState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  //Heading
                  Text(
                    AppStrings.heading,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  //Carousel
                  CustomCarouselWidget(
                    state: state,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  //Carousel Indicator
                  CustomCarouselIndicatorWidget(state: state),
                  SizedBox(
                    height: 2.h,
                  ),
                  //Food Items Filters
                  SizedBox(
                    height: 5.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: ['', 'Salads', 'Pizza', 'Beverages', 'Snacks']
                          .map((e) => CustomChipButton(
                                text: e,
                                isText: e == "" ? false : true,
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  //Food Item Cards
                  FoodItemCardsListWidget(
                    state: state,
                  )
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
