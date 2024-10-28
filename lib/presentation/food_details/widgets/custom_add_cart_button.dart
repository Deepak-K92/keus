import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/app_strings.dart';
import '../../../extensions/extensions.dart';
import '../../../style/colors.dart';

class CustomAddCartButton extends StatelessWidget {
  final double total;
  final Function()? onTap;
  const CustomAddCartButton({
    super.key,
    required this.total,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 6.h,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 0.w),
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          color: CustomColors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.addToCart,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              total.formatToPriceDouble(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
