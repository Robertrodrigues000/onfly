import 'package:flutter/material.dart';

import '../../core/theme/app_color.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final double? width;
  final double? height;

  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        child: Text(title),
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary, shape: StadiumBorder()),
        onPressed: () => onPressed(),
      ),
    );
  }
}
