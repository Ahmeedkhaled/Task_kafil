import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/my_theme.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomElevatedButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0.0),
          backgroundColor: WidgetStateProperty.all(MyTheme.primaryColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 15, color: MyTheme.whiteColor)),
      ),
    );
  }
}
