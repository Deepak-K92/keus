import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../extensions/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_strings.dart';
import '../../../cubit/food_items_cubit.dart';
import '../../../style/colors.dart';

class PayCTAWidget extends StatelessWidget {
  final Function()? onTap;
  const PayCTAWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: CustomColors.black,
            borderRadius: BorderRadius.circular(2.h)),
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        width: 85.w,
        child: Row(
          children: [
            Text(
              AppStrings.pay,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white),
            ),
            const Spacer(),
            Text(
              AppStrings.deliveryTime1,
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
              BlocProvider.of<FoodItemsCubit>(context)
                  .total
                  .formatToPriceDouble(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemQuantWidget extends StatelessWidget {
  final Function()? onAdd, onSub;
  const ItemQuantWidget({
    super.key,
    required this.quantity,
    required this.onAdd,
    required this.onSub,
  });

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(icon: Icons.remove, onTap: onSub),
        SizedBox(
          width: 3.w,
        ),
        Text(
          quantity.toString(),
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 3.w,
        ),
        CustomIconButton(
          icon: Icons.add,
          onTap: onAdd,
        ),
      ],
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  const CustomIconButton({
    super.key,
    this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(1.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: CustomColors.grey),
        child: Center(
          child: Icon(
            icon,
            color: CustomColors.grey3,
            size: 2.5.h,
          ),
        ),
      ),
    );
  }
}

class ApplePayLogoWidget extends StatelessWidget {
  const ApplePayLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.6.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          border: Border.all(color: CustomColors.black, width: 0.5.w)),
      child: Row(
        children: [
          Icon(
            Icons.apple_sharp,
            size: 2.h,
          ),
          const Text(AppStrings.pay)
        ],
      ),
    );
  }
}
