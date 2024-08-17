import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_kafel_company/view/screens/auth/login/login_screen.dart';
import 'package:task_kafel_company/view/screens/home/who/widget/custom_skills_field.dart';
import 'package:task_kafel_company/view/screens/home/who/widget/image_who_screen.dart';
import 'package:task_kafel_company/view/widgets/about_field.dart';
import 'package:task_kafel_company/view/widgets/custom_appbar.dart';
import 'package:task_kafel_company/view/widgets/custom_date_calender.dart';
import 'package:task_kafel_company/view/widgets/custom_salary_field.dart';
import 'package:task_kafel_company/view/widgets/email_widget.dart';
import 'package:task_kafel_company/view/widgets/favourite_selection.dart';
import 'package:task_kafel_company/view/widgets/first_last_name_register.dart';
import 'package:task_kafel_company/view/widgets/gander_selection.dart';
import 'package:task_kafel_company/view/widgets/password_field.dart';
import 'package:task_kafel_company/view/widgets/user_type.dart';

class WhoScreen extends StatefulWidget {
  const WhoScreen({super.key});

  @override
  State<WhoScreen> createState() => _WhoScreenState();
}

class _WhoScreenState extends State<WhoScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final aboutController = TextEditingController();
  final birthDateController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  List<String>? skills;
  String gender = '';
  List<String>? favorites;
  String userType = '';
  double? salary;
  String? imagePath;
  List<String> selectedSocialMedia = [];
  Map<String, bool> _selectedSocialMedia = {
    'Facebook': false,
    'Twitter': false,
    'LinkedIn': false,
  };
  bool showSocialMediaError = false;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      emailController.text = prefs.getString('email') ?? '';
      aboutController.text = prefs.getString('about') ?? '';
      firstNameController.text = prefs.getString('firstName') ?? '';
      lastNameController.text = prefs.getString('lastName') ?? '';
      passwordController.text = prefs.getString('password') ?? '';
      userType = prefs.getString('userType') ?? '';
      birthDateController.text = prefs.getString('birthDate') ?? '';
      gender = prefs.getString('gender') ?? '';
      skills = prefs.getStringList('skills');
      salary = prefs.getDouble('salary');
      imagePath = prefs.getString('imagePath');
      List<String>? selectedSocialMediaList =
          prefs.getStringList('selectedSocialMedia');
      if (selectedSocialMediaList != null) {
        _selectedSocialMedia = {
          for (String socialMedia in selectedSocialMediaList) socialMedia: true,
        };
      }
    });
  }

  Future<void> _saveImagePath(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('imagePath', path);
    setState(() {
      imagePath = path;
    });
  }

  void _handleSkillsSelected(List<String> selectedSkills) {
    setState(() {
      skills = selectedSkills;
    });
  }

  // Future<void> _saveData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('email', emailController.text);
  //   await prefs.setString('about', aboutController.text);
  //   await prefs.setString('firstName', firstNameController.text);
  //   await prefs.setString('lastName', lastNameController.text);
  //   await prefs.setString('password', passwordController.text);
  //   await prefs.setString('userType', userType);
  //   await prefs.setString('birthDate', birthDateController.text);
  //   await prefs.setString('gender', gender);
  //   await prefs.setStringList('skills', skills ?? []);
  //   await prefs.setStringList('favorites', favorites ?? []);
  //   await prefs.setDouble('salary', salary ?? 0);
  //   await prefs.setString('imagePath', imagePath ?? '');
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04,
              vertical: MediaQuery.of(context).size.height * 0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomAppbar(
                      text: "Who Am I",
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        icon: const Icon(Icons.logout)),
                  ],
                ),
                const SizedBox(height: 24),
                if (imagePath != null)
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: FileImage(File(imagePath!)),
                  )
                else
                  ImageWhoScreen(onImageSelected: _saveImagePath),
                const SizedBox(height: 30),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FirstLastNameTextField(
                        firstNameController: firstNameController,
                        lastNameController: lastNameController,
                      ),
                      const SizedBox(height: 30),
                      EmailField(controller: emailController),
                      const SizedBox(height: 30),
                      PasswordField(controller: passwordController),
                      const SizedBox(height: 30),
                      UserType(
                        onChanged: (value) {
                          setState(() {
                            userType = value;
                          });
                        },
                        initialUserType: userType,
                      ),
                      const SizedBox(height: 30),
                      AboutField(aboutController: aboutController),
                      const SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomSalaryField(
                            money: salary ?? 0,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          CustomDateCalender(
                            birthDateController: birthDateController,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          GenderSelection(
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                            initialGender: gender,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          CustomSkillsField(
                            initialSkills: skills ?? [],
                            onSkillsSelected: _handleSkillsSelected,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          if (_selectedSocialMedia.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Selected Social Media:',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(height: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: _selectedSocialMedia.keys
                                      .map((socialMedia) {
                                    return Row(
                                      children: [
                                        Checkbox(
                                          value: _selectedSocialMedia[
                                              socialMedia]!,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              _selectedSocialMedia[
                                                  socialMedia] = value ?? false;
                                            });
                                          },
                                          activeColor:
                                              Theme.of(context).primaryColor,
                                        ),
                                        Text(socialMedia,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 14,
                                                    color: const Color(
                                                        0xff000000))),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ],
                            )
                          else
                            SocialMediaSelection(
                              onChanged: (selectedSocialMedia) {
                                setState(() {
                                  _selectedSocialMedia.clear();
                                  _selectedSocialMedia
                                      .addAll(selectedSocialMedia);
                                  showSocialMediaError = false;
                                });
                              },
                            ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
