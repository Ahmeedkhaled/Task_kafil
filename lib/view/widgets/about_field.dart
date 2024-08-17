import 'package:flutter/material.dart';
import 'package:task_kafel_company/view/widgets/custom_text_field.dart';

class AboutField extends StatelessWidget {
  const AboutField({super.key, required this.aboutController});
  final TextEditingController aboutController;

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      maxLines: 5,
      fieldName: "About",
      controller: aboutController,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Please enter About You";
        }
        return null;
      },
    );
  }
}
