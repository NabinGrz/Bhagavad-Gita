import 'dart:ui';

import 'package:bhagvadgita/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: screenHeight(context) * 0.28,
      width: double.infinity,
      child: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Image.asset(
              "assets/images/verseBackground.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: screenWidth(context) * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Image.asset(
                "assets/images/verseBackground2.png",
                width: screenWidth(context) * 0.8,
                fit: BoxFit.fitWidth,
              ),
            ),
          )
        ],
      ),
    );
  }
}
