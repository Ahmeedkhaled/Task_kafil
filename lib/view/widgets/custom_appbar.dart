import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/my_theme.dart';

class CustomAppbar extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback? onPressed;

  const CustomAppbar({
    super.key,
    this.icon,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null)
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 24,
              color: MyTheme.blackColor,
            ),
          ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
