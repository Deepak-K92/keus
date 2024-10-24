import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../cubit/food_items_cubit.dart';
import '../../../style/colors.dart';

class CustomCarouselIndicatorWidget extends StatelessWidget {
  final FoodItemsLoadedState state;
  const CustomCarouselIndicatorWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.5.h,
      width: 100.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: state.items.length,
          itemBuilder: (context, index) => SizedBox(
            height: 0.5.h,
            width: 20.w,
            child: Padding(
              padding: EdgeInsets.only(right: 3.w),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: state.activePage == index
                    ? CustomColors.black
                    : CustomColors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
