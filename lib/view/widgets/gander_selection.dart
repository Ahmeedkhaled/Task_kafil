import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/my_theme.dart';

// ignore: must_be_immutable
class GenderSelection extends StatefulWidget {
  GenderSelection({
    super.key,
    required Null Function(dynamic value) onChanged,
    required String initialGender,
  });

  static String? selectedGender;
  bool showError = false;

  @override
  // ignore: library_private_types_in_public_api
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  void validateSelection() {
    setState(() {
      if (GenderSelection.selectedGender == null) {
        widget.showError = true;
      } else {
        widget.showError = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Row(
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: GenderSelection.selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      GenderSelection.selectedGender = value;
                      widget.showError = false;
                    });
                  },
                  activeColor: MyTheme.primaryColor,
                ),
                Text(
                  'Male',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: const Color(0xff000000)),
                ),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Female',
                  groupValue: GenderSelection.selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      GenderSelection.selectedGender = value;
                      widget.showError = false;
                    });
                  },
                  activeColor: MyTheme.primaryColor,
                ),
                Text(
                  'Female',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: const Color(0xff000000)),
                ),
              ],
            ),
          ],
        ),
        if (widget.showError)
          Container(
            color: const Color(0xffFFF0ED),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            alignment: Alignment.center,
            child: Row(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Color(0xffF56342),
                ),
                const SizedBox(width: 12),
                Text(
                  'Fill the required fields',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffF56342),
                      ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
