import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/my_theme.dart';

class RememberAndForgetWidget extends StatefulWidget {
  const RememberAndForgetWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RememberAndForgetWidgetState createState() =>
      _RememberAndForgetWidgetState();
}

class _RememberAndForgetWidgetState extends State<RememberAndForgetWidget> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isCheck = !isCheck;
                });
              },
              child: Container(
                width: 16,
                height: 16,
                color: MyTheme.primaryColor,
                child: isCheck
                    ? Icon(
                        Icons.check,
                        size: 12,
                        color: MyTheme.whiteColor,
                      )
                    : Icon(
                        Icons.cancel,
                        size: 12,
                        color: MyTheme.whiteColor,
                      ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              "Remember me",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        InkWell(
          onTap: () {},
          child: Text(
            "Forgot Password?",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
