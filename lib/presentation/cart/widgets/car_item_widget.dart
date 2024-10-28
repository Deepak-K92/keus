import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../extensions/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../cubit/food_items_cubit.dart';
import '../../../style/colors.dart';
import '../../model/cart_model.dart';
import 'custom_buttons.dart';

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
