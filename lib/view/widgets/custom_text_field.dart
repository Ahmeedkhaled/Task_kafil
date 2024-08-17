import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/my_theme.dart';

class TextFieldWidget extends StatelessWidget {
  final String? fieldName;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? isObscure;
  final bool? isConfirmObscure;
  final TextInputType keyBoardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int? maxLines;

  const TextFieldWidget({
    super.key,
    this.hintText,
    this.maxLines,
    this.fieldName,
    this.suffixIcon,
    this.isObscure = false,
    this.isConfirmObscure = false,
    this.keyBoardType = TextInputType.text,
    required this.controller,
    required this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          fieldName ?? "",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        TextFormField(
          maxLines: isObscure != true
              ? maxLines
              : 1, // Ensure maxLines is 1 if obscureText is true
          style: TextStyle(color: MyTheme.blackColor),
          validator: validator,
          controller: controller,
          obscureText: isObscure ?? false,
          keyboardType: keyBoardType,
          onChanged: onChanged,

          decoration: InputDecoration(
            hintText: hintText,
            fillColor: const Color(0xffEEEEEE),
            filled: true,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            hintStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: MyTheme.blackColor),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
