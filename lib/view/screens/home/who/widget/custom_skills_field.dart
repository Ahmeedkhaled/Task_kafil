import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/my_theme.dart';

class CustomSkillsField extends StatelessWidget {
  final List<String> initialSkills;
  final Function(List<String>) onSkillsSelected;

  const CustomSkillsField({
    super.key,
    required this.initialSkills,
    required this.onSkillsSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Skills",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
              color: const Color(0xffEEEEEE),
              borderRadius: BorderRadius.circular(25)),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.15,
          child: Wrap(
            spacing: 8,
            children: List.generate(
              initialSkills.length,
              (index) => _buildSkillChip(initialSkills[index], context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: GestureDetector(
        onTap: () {
          // Do nothing on tap
        },
        child: Chip(
          label: Text(skill),
          backgroundColor: const Color(0xffE9F9F1),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelStyle: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: MyTheme.primaryColor),
        ),
      ),
    );
  }
}
