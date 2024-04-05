import 'package:bhagvadgita/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorWidget extends StatelessWidget {
  final String? errorMsg;
  const CustomErrorWidget({
    super.key,
    required this.errorMsg,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 100.w,
            ),
            Text(
              errorMsg ?? "Something went wrong",
              textAlign: TextAlign.center,
              style: regular().copyWith(
                fontSize: 18.sp,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
