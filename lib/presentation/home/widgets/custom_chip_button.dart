import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:sizer/sizer.dart';

import '../../../style/colors.dart';

class CustomChipButton extends StatelessWidget {
  final String? text;
  final bool isText;
  final Icon? icon;
  final FontWeight? fontWeight;
  final BorderRadiusGeometry? borderRadius;
  const CustomChipButton(
      {super.key,
      required this.text,
      this.isText = false,
      this.icon,
      this.borderRadius,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 3.w),
      height: 5.h,
      padding: EdgeInsets.symmetric(
          horizontal: text == "" ? 3.w : 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        color: CustomColors.grey,
        // color: Colors.grey.withOpacity(0.23),
      ),
      child: Center(
        child: isText
            ? Text(
                text ?? "",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: fontWeight),
              )
            : Icon(
                Symbols.tune,
                size: 2.h,
              ),
      ),
    );
  }
}
