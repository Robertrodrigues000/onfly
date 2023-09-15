import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_color.dart';

class TabTitleWidget extends StatelessWidget {
  const TabTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 33,
              color: AppColors.textColor,
            ),
            children: const [
              TextSpan(text: 'on'),
              TextSpan(
                text: 'fly',
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        ),
        SvgPicture.asset(
          'assets/globe.svg',
          height: 30,
          width: 30,
        )
      ],
    );
  }
}
