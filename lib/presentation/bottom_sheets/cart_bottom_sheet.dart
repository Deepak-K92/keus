import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keus_assignment/extensions/extensions.dart';

import 'package:sizer/sizer.dart';

import '../../constants/app_strings.dart';
import '../../cubit/food_items_cubit.dart';
import '../../style/colors.dart';
import '../model/cart_model.dart';

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
                    height: 25.h,
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
              "24 min",
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

class DeilveryWidget extends StatelessWidget {
  const DeilveryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.delivery,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 0.8.h,
              ),
              Text(
                AppStrings.deliverySubTitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.normal, color: CustomColors.grey2),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              (0.00).formatToPriceDouble(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class CutleryWidget extends StatelessWidget {
  const CutleryWidget({
    super.key,
    required this.cubit,
  });

  final FoodItemsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.restaurant,
                color: CustomColors.black,
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                AppStrings.cutlery,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              ItemQuantWidget(
                quantity: cubit.cutlery,
                onAdd: () => BlocProvider.of<FoodItemsCubit>(context)
                    .addCutleryQuant(quant: cubit.cutlery),
                onSub: () => BlocProvider.of<FoodItemsCubit>(context)
                    .subCutleryQuant(quant: cubit.cutlery),
              ),
            ],
          ),
        ),
        const Divider(
          color: CustomColors.grey,
        ),
      ],
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartModel item;
  const CartItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 10.h,
              width: 10.h,
              margin: EdgeInsets.only(bottom: 1.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.h),
                  image: DecorationImage(
                    image: AssetImage(item.imageUrl),
                  )),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          item.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 2,
                        child: Text(
                          (item.quantity * item.price).formatToPriceDouble(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      ItemQuantWidget(
                        quantity: item.quantity,
                        onAdd: () => BlocProvider.of<FoodItemsCubit>(context)
                            .addItemQuant(quant: item.quantity, item: item),
                        onSub: () => BlocProvider.of<FoodItemsCubit>(context)
                            .subItemQuant(quant: item.quantity, item: item),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        const Divider(
          color: CustomColors.grey,
        ),
      ],
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
