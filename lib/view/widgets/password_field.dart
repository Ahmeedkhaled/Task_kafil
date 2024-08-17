import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/my_theme.dart';
import 'package:task_kafel_company/view/widgets/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({super.key, required this.controller});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      fieldName: "Password",
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
          return "Please enter your password";
        }
        return null;
      },
    );
  }
}
