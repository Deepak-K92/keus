import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_strings.dart';
import '../../../cubit/food_items_cubit.dart';
import '../../../style/colors.dart';
import 'custom_buttons.dart';

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
