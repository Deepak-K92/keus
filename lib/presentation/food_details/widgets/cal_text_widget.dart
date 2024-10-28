import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../style/colors.dart';

class CalTextWidget extends StatelessWidget {
  final String calVal, calDesc;
  const CalTextWidget({super.key, required this.calVal, required this.calDesc});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          calVal,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold, color: CustomColors.black),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Text(
          calDesc,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.normal, color: CustomColors.grey2),
        ),
      ],
    );
  }
}
