import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/my_theme.dart';
import 'package:task_kafel_company/view/widgets/custom_text_field.dart';

class ConfirmPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;

  const ConfirmPasswordField({
    super.key,
    required this.controller,
    required this.passwordController,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ConfirmPasswordFieldState createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldWidget(
          fieldName: "Confirm Password",
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            icon: Icon(
              isObscure ? Icons.visibility_off : Icons.visibility,
              color: MyTheme.grayColor,
            ),
          ),
          isObscure: isObscure,
          controller: widget.controller,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Please enter your Confirm password";
            }
            if (value != widget.passwordController.text) {
              return "Passwords do not match";
            }
            return null;
          },
        ),
      ],
    );
  }
}
