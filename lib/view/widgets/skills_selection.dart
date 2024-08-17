import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/my_theme.dart';

class SkillsSelection extends StatefulWidget {
  const SkillsSelection({
    super.key,
    required this.onChanged,
    required this.initialSkills,
  });

  final Function(List<String> selectedSkills) onChanged;
  final List<String> initialSkills;

  @override
  // ignore: library_private_types_in_public_api
  _SkillsSelectionState createState() => _SkillsSelectionState();
}

class _SkillsSelectionState extends State<SkillsSelection> {
  final TextEditingController _skillController = TextEditingController();
  final List<String> _skills = [];
  final List<String> _availableSkills = [
    'Flutter',
    'Dart',
    'JavaScript',
    'Python',
    'Java',
    'C++'
  ];

  @override
  void initState() {
    super.initState();
    _skills.addAll(widget.initialSkills);
    _skillController.text = _skills.join(', ');
  }

  void _addSkill(String skill) {
    setState(() {
      if (skill.isNotEmpty && !_skills.contains(skill)) {
        _skills.add(skill);
        _skillController.text = _skills.join(', ');
        widget.onChanged(_skills);
      }
    });
  }

  void _removeSkill(int index) {
    setState(() {
      _skills.removeAt(index);
      _skillController.text = _skills.join(', ');
      widget.onChanged(_skills);
    });
  }

  void _showSkillPicker() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // ignore: prefer_const_constructors
          title: Text('Select a skill'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _availableSkills.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_availableSkills[index]),
                  onTap: () {
                    _addSkill(_availableSkills[index]);
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Skills",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: _showSkillPicker,
          child: AbsorbPointer(
            child: TextField(
              controller: _skillController,
              decoration: InputDecoration(
                fillColor: const Color(0xffEEEEEE),
                filled: true,
                hintText: 'Enter a skill',
                hintStyle: const TextStyle(color: Colors.green),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              maxLines: 3,
              style: const TextStyle(color: Colors.green), // Text color
            ),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          children: _skills.asMap().entries.map((entry) {
            int index = entry.key;
            String skill = entry.value;
            return Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Chip(
                side: BorderSide.none,
                backgroundColor: const Color(0xffE9F9F1),
                label: Text(
                  skill,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: MyTheme.primaryColor, fontSize: 12),
                ),
                deleteIcon: Icon(
                  Icons.close_outlined,
                  color: MyTheme.primaryColor,
                  size: 18,
                ),
                onDeleted: () => _removeSkill(index),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
