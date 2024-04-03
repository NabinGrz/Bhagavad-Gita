import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  const BuildText(
      {super.key,
      this.text = '',
      this.fontSize = 14.0,
      this.color = Colors.black,
      this.weight = FontWeight.w500,
      this.decoration = TextDecoration.none,
      this.textAlign = TextAlign.start,
      this.maxLines = 4,
      this.height = 1.2,
      this.italics = false,
      this.family,
      this.letterSpacing,
      this.overFlow,
      this.hasError = false});
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight weight;
  final TextDecoration decoration;
  final TextAlign textAlign;
  final int maxLines;
  final double height;
  final bool italics;
  final bool hasError;
  final String? family;
  final double? letterSpacing;
  final TextOverflow? overFlow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines == 0 ? 50000 : maxLines,
      overflow: overFlow ?? TextOverflow.ellipsis,
      style: TextStyle(
          fontWeight: weight,
          fontSize: fontSize,
          color: color,
          height: height,
          decoration: decoration,
          fontFamily: family,
          letterSpacing: letterSpacing ?? 0),
    );
  }
}
