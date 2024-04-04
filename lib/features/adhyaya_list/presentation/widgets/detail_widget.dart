import 'package:bhagvadgita/core/extensions/num_extension.dart';
import 'package:bhagvadgita/core/extensions/string_extension.dart';
import 'package:bhagvadgita/core/theme/app_colors.dart';
import 'package:bhagvadgita/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "lastread".localize(context),
              style: extraBold().copyWith(
                fontSize: 16.sp,
                color: AppColor.textprimary,
              ),
            ),
            Text(
              "VERSES 7.27",
              style: regular().copyWith(
                fontSize: 12.sp,
                color: AppColor.textprimary,
              ),
            ),
          ],
        ),
        6.height,
        Text(
          "O Bharata, all beings are subject to delusion at birth due to the delusion of the pairs of opposites arising form desire and aversion, OParantapa",
          style: regular().copyWith(
            fontSize: 14.sp,
            color: AppColor.textprimary,
          ),
        ),
        8.height,
        Text(
          "continueReading".localize(context).toUpperCase(),
          style: medium().copyWith(
            fontSize: 12.sp,
            color: AppColor.primary,
          ),
        ),
        18.height,
        Text(
          "chapters".localize(context),
          style: extraBold().copyWith(
            fontSize: 16.sp,
            color: AppColor.textprimary,
          ),
        ),
      ],
    );
  }
}
