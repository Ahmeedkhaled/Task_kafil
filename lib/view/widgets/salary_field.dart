import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/my_theme.dart';

class SalaryField extends StatefulWidget {
  final Null Function(dynamic value) onChanged;
  final double initialSalary;

  const SalaryField({
    super.key,
    required this.onChanged,
    required this.initialSalary,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SalaryFieldState createState() => _SalaryFieldState();
}

class _SalaryFieldState extends State<SalaryField> {
  late double salary;

  @override
  void initState() {
    super.initState();
    salary = widget.initialSalary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1.2,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffEEEEEE),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: MyTheme.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (salary <= 0) {
                      return;
                    }
                    salary -= 10;
                    widget.onChanged(salary);
                  });
                },
                icon: Icon(
                  Icons.remove,
                  color: MyTheme.primaryColor,
                ),
              ),
            ),
          ),
          Text(
            "SAR $salary",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: const Color(0xff333333)),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: MyTheme.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    salary += 10;
                    widget.onChanged(salary);
                  });
                },
                icon: Icon(
                  Icons.add,
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
