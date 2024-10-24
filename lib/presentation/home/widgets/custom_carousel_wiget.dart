import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../cubit/food_items_cubit.dart';
import '../../../style/colors.dart';

class CustomCarouselWidget extends StatelessWidget {
  final FoodItemsLoadedState state;
  const CustomCarouselWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.h,
      child: PageView.builder(
        controller: BlocProvider.of<FoodItemsCubit>(context).pageController,
        onPageChanged: (value) {
          BlocProvider.of<FoodItemsCubit>(context)
              .setActivePageValue(value: value);
        },
        scrollDirection: Axis.horizontal,
        itemCount: state.items.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            top: 5.h,
          ),
          child: Stack(
            alignment: const Alignment(0, -1.5),
            children: [
              Container(
                height: 30.h,
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: index % 2 == 1 ? [0.7, 0.95] : [0.3, 0.7],
                      colors: index % 2 == 1
                          ? [
                              CustomColors.purple,
                              const Color.fromARGB(255, 230, 230, 186),
                            ]
                          : [
                              CustomColors.blue,
                              CustomColors.purple,
                            ]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                  alignment: const Alignment(0, 0.7),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          state.items[index].name ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          padding: EdgeInsets.symmetric(vertical: 0.7.h),
                          decoration: BoxDecoration(
                            color: CustomColors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "\$${state.items[index].price}",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Image
              Container(
                height: 20.h,
                width: 20.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    image: DecorationImage(
                      image: AssetImage(state.items[index].imageUrl ?? ''),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
