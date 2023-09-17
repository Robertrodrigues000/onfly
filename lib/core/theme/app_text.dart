import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLine;

  const AppText({super.key, required this.text, this.style, this.maxLine});


  AppText.sessionTitle(this.text, {this.maxLine, super.key})
      : style = GoogleFonts.roboto(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        );

  AppText.secondaryText(this.text, {this.maxLine, super.key})
      : style = GoogleFonts.roboto(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.textColor,
        );

  AppText.bodyText(this.text, {this.maxLine, super.key})
      : style = GoogleFonts.roboto(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLine,
    );
  }
}
