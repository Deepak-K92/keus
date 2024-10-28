import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';
import '../../constants/app_strings.dart';
import '../../cubit/food_items_cubit.dart';
import '../../style/colors.dart';

import 'widgets/car_item_widget.dart';
import 'widgets/custom_buttons.dart';
import 'widgets/cutlery_widget.dart';
import 'widgets/delivery_widget.dart';

showCartBottomSheet({
  required BuildContext context,
  required FoodItemsLoadedState state,
}) {
  var cubit = BlocProvider.of<FoodItemsCubit>(context);
  showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    builder: (context) => Stack(
      alignment: const Alignment(0.0, -1.05),
      children: [
        BlocBuilder<FoodItemsCubit, FoodItemsState>(
          builder: (context, state) {
            return Container(
              height: 93.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
              child: ListView(
                // shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  // Heading
                  Text(
                    AppStrings.cartHeading,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  //Address
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: "${AppStrings.address}   ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: AppStrings.changeAddress,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w300,
                            color: CustomColors.grey2),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 3.h,
                  ),
                  //Cart Items
                  SizedBox(
                    //In case of FixedHeight uncomment below code.
                    // height: 25.h,
                    child: Scrollbar(
                      trackVisibility: true,
                      child: SingleChildScrollView(
                        child: Column(
                          children: cubit.cartItems
                              .map((item) => CartItemWidget(
                                    item: item,
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  //Cutlery
                  CutleryWidget(cubit: cubit),
                  SizedBox(
                    height: 2.h,
                  ),
                  //Delivery
                  const DeilveryWidget(),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    AppStrings.paymentMethod,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: CustomColors.grey2),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  // Apple Pay
                  Row(
                    children: [
                      const ApplePayLogoWidget(),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        AppStrings.applePay,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.chevron_right_sharp,
                        color: CustomColors.black,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  //Payment Submit CTA
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PayCTAWidget(
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        Container(
          height: 0.8.h,
          width: 10.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
        )
      ],
    ),
  );
}
