import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../style/colors.dart';

import 'package:sizer/sizer.dart';

import '../../constants/app_strings.dart';
import '../../cubit/food_items_cubit.dart';
import 'widgets/cal_text_widget.dart';
import 'widgets/custom_add_cart_button.dart';
import 'widgets/custom_counter_widget.dart';

showFoodItemDetailsBottomSheet(
    {required BuildContext context,
    required FoodItemsLoadedState state,
    required int index}) {
  var cubit = BlocProvider.of<FoodItemsCubit>(context);
  cubit.checkDefaultQuantity(index: index);
  showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    builder: (context) => Stack(
      alignment: const Alignment(0.0, -1.05),
      children: [
        Container(
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
                height: 3.h,
              ),
              //Image
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.h),
                        image: DecorationImage(
                          image: AssetImage(state.items[index].imageUrl ?? ''),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              //Name
              Text(
                state.items[index].name ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 2.h,
              ),
              //Description
              Text(
                state.items[index].description ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: CustomColors.grey2),
              ),
              SizedBox(
                height: 3.h,
              ),
              //Calorie Values
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 1.h,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: CustomColors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //kcal
                    CalTextWidget(
                      calVal: state.items[index].calories
                          .toString()
                          .replaceAll(' Kcal', ''),
                      calDesc: AppStrings.kcal,
                    ),
                    //grams
                    CalTextWidget(
                      calVal: state.items[index].grams.toString(),
                      calDesc: AppStrings.grams,
                    ),
                    //proteins
                    CalTextWidget(
                      calVal: state.items[index].proteins.toString(),
                      calDesc: AppStrings.proteins,
                    ),
                    //fats
                    CalTextWidget(
                      calVal: state.items[index].fats.toString(),
                      calDesc: AppStrings.fats,
                    ),
                    //carbs
                    CalTextWidget(
                      calVal: state.items[index].carbs.toString(),
                      calDesc: AppStrings.carbs,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              //Add In
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: Row(
                  children: [
                    Text(
                      AppStrings.addInPoke,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: CustomColors.black,
                          ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.chevron_right_sharp,
                      color: CustomColors.black,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              BlocBuilder<FoodItemsCubit, FoodItemsState>(
                builder: (context, state1) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomCounterWidget(
                          onDecrease: () {
                            BlocProvider.of<FoodItemsCubit>(context)
                                .decrementPrice(index: index);
                          },
                          onIncrease: () {
                            BlocProvider.of<FoodItemsCubit>(context)
                                .incrementPrice(index: index);
                          },
                          quantity: cubit.quantity,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        flex: 3,
                        child: CustomAddCartButton(
                          onTap: () {
                            BlocProvider.of<FoodItemsCubit>(context)
                                .onAddToCart(
                                    details: state.items[index],
                                    quantity: cubit.quantity);
                          },
                          total:
                              cubit.quantity * (state.items[index].price ?? 1),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  );
                },
              ),
              //
            ],
          ),
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
