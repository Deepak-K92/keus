import 'package:flutter/material.dart';
import '../../../extensions/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_strings.dart';
import '../../../style/colors.dart';

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
