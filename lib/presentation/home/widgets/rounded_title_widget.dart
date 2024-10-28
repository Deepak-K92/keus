import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_strings.dart';
import '../../../style/colors.dart';

class RoundedTitleWiget extends StatelessWidget {
  const RoundedTitleWiget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      decoration: BoxDecoration(
        color: CustomColors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.address,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              minRadius: 0.7.w,
            ),
          ),
          Text(
            AppStrings.deliveryTime,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
