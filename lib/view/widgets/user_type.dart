import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/my_theme.dart';

// ignore: must_be_immutable
class UserType extends StatefulWidget {
  UserType({
    super.key,
    required String initialUserType,
    required Null Function(dynamic value) onChanged,
  });
  static String? selectedUser;
  bool showError = false;

  @override
  // ignore: library_private_types_in_public_api
  _UserTypeState createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  void validateSelection() {
    setState(() {
      if (UserType.selectedUser == null) {
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
        Text("User Type", style: Theme.of(context).textTheme.titleSmall),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Row(
          children: <String>['seller', 'buyer', 'both'].map((String value) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<String>(
                  activeColor: MyTheme.primaryColor,
                  value: value,
                  groupValue: UserType.selectedUser,
                  onChanged: (String? newValue) {
                    setState(() {
                      UserType.selectedUser = newValue;
                      widget.showError = false;
                    });
                  },
                ),
                Text(value, style: Theme.of(context).textTheme.bodySmall),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
