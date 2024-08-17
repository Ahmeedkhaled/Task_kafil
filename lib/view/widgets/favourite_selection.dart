import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_kafel_company/constant/my_theme.dart';

class SocialMediaSelection extends StatefulWidget {
  final Function(Map<String, bool> selectedSocialMedia) onChanged;
  const SocialMediaSelection({
    super.key,
    required this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SocialMediaSelectionState createState() => _SocialMediaSelectionState();
}

class _SocialMediaSelectionState extends State<SocialMediaSelection> {
  final Map<String, bool> _selectedSocialMedia = {
    'Facebook': false,
    'Twitter': false,
    'LinkedIn': false,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Favorite Social Media",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        _buildSocialMediaCheckbox('Facebook', FontAwesomeIcons.facebook),
        _buildSocialMediaCheckbox('Twitter', FontAwesomeIcons.twitter),
        _buildSocialMediaCheckbox('LinkedIn', FontAwesomeIcons.linkedin),
      ],
    );
  }

  Widget _buildSocialMediaCheckbox(String name, IconData icon) {
    return Row(
      children: [
        Checkbox(
          value: _selectedSocialMedia[name] ?? false,
          onChanged: (bool? value) {
            setState(() {
              _selectedSocialMedia[name] = value ?? false;
              widget.onChanged(_selectedSocialMedia);
            });
          },
          activeColor: MyTheme.primaryColor,
        ),
        Icon(
          icon,
          color: Colors.blue,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          name,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: const Color(0xff000000)),
        ),
      ],
    );
  }
}
