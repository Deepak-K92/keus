import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../cubit/food_items_cubit.dart';
import '../../../style/colors.dart';
import '../../bottom_sheets/food_items_bottom_sheet.dart';
import 'custom_chip_button.dart';

class FoodItemCardsListWidget extends StatelessWidget {
  final FoodItemsLoadedState state;
  const FoodItemCardsListWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: 2.h),
        physics: const ScrollPhysics(),
        itemCount: state.items.length,
        separatorBuilder: (context, index) => SizedBox(
          height: 1.h,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            //ToDo: Trigger Food Details BottomSheet
            showFoodItemDetailsBottomSheet(
                context: context, state: state, index: index);
          },
          child: SizedBox(
            height: 15.h,
            child: Row(
              children: [
                //Food Image
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        image: DecorationImage(
                          image: AssetImage(state.items[index].imageUrl ?? ''),
                        )),
                  ),
                ),
                //Food Item Details
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.items[index].name ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomChipButton(
                                isText: true,
                                fontWeight: FontWeight.w600,
                                borderRadius: BorderRadius.circular(20),
                                text: "\$${state.items[index].price}",
                              ),
                              Text(
                                state.items[index].calories ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: CustomColors.grey2,
                                        fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
