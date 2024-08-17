import 'package:flutter/material.dart';
import 'package:task_kafel_company/view/widgets/custom_text_field.dart';

class FirstLastNameTextField extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  const FirstLastNameTextField({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFieldWidget(
          fieldName: "First Name",
          controller: firstNameController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Please enter your first name";
            }
            return null;
          },
        )),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: TextFieldWidget(
            fieldName: "Last Name",
            controller: lastNameController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Please enter your last name";
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
