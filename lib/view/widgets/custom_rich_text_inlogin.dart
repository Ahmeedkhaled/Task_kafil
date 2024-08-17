import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/my_theme.dart';
import 'package:task_kafel_company/view/screens/auth/register/register_screen.dart';

class RichTextWithInkWell extends StatelessWidget {
  const RichTextWithInkWell({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Don’t have an account? ",
        style: Theme.of(context).textTheme.bodySmall,
        children: [
          WidgetSpan(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    pageBuilder: (_, __, ___) => const RegisterScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Text(
                "Register",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      color: MyTheme.primaryColor,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
