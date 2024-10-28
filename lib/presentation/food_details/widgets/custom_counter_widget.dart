import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../style/colors.dart';

class CustomCounterWidget extends StatelessWidget {
  final Function() onIncrease, onDecrease;
  final int quantity;
  const CustomCounterWidget(
      {super.key,
      required this.onIncrease,
      required this.onDecrease,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 35.w,
      height: 6.h,
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      decoration: BoxDecoration(
          color: CustomColors.grey, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () => onDecrease(),
            icon: const Icon(
              Icons.remove,
              color: CustomColors.grey3,
            ),
          ),
          Text(
            "$quantity",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () => onIncrease(),
            icon: const Icon(
              Icons.add,
              color: CustomColors.grey3,
            ),
          ),
        ],
      ),
    );
  }
}
