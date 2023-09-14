import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_color.dart';

class TabTitleWidget extends StatelessWidget {
  const TabTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.bebasNeue(
          fontWeight: FontWeight.w400,
          fontSize: 33,
          color: AppColors.textColor,
        ),
        children: const [
          TextSpan(text: 'ON'),
          TextSpan(
            text: 'FLY',
            style: TextStyle(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
