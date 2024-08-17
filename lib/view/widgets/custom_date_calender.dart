import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/show_toast.dart';
import 'package:intl/intl.dart'; // Import the intl package

class CustomDateCalender extends StatelessWidget {
  const CustomDateCalender({
    super.key,
    required this.birthDateController,
  });

  final TextEditingController birthDateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Birth Date",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        TextField(
          readOnly: true,
          style: const TextStyle(color: Colors.black),
          onTap: () {
            showCalender(context);
          },
          controller: birthDateController,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffEEEEEE),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: const Icon(Icons.calendar_today),
          ),
        ),
      ],
    );
  }

  void showCalender(BuildContext context) async {
    var choosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
    );

    if (choosenDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(choosenDate);
      birthDateController.text = formattedDate;
    } else {
      CustomToast.showToast(message: 'You didn\'t select a date');
    }
  }
}
