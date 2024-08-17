import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_kafel_company/view/screens/auth/register/register_screen.dart';
import 'package:task_kafel_company/view/screens/home/home_screen.dart';
import 'package:task_kafel_company/view/widgets/about_field.dart';
import 'package:task_kafel_company/view/widgets/custom_appbar.dart';
import 'package:task_kafel_company/view/widgets/custom_button.dart';
import 'package:task_kafel_company/view/widgets/custom_date_calender.dart';
import 'package:task_kafel_company/view/widgets/favourite_selection.dart';
import 'package:task_kafel_company/view/widgets/gander_selection.dart';
import 'package:task_kafel_company/view/widgets/image_picker.dart';
import 'package:task_kafel_company/view/widgets/salary_field.dart';
import 'package:task_kafel_company/view/widgets/skills_selection.dart';

class SecondRegisterScreen extends StatefulWidget {
  const SecondRegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SecondRegisterScreenState createState() => _SecondRegisterScreenState();
}

class _SecondRegisterScreenState extends State<SecondRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController aboutController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  String gender = '';
  List<String> skills = [];
  List<String> favorites = [];
  double salary = 0.0;
  String imagePath = '';
  final Map<String, bool> _selectedSocialMedia = {
    'Facebook': false,
    'Twitter': false,
    'LinkedIn': false,
  };
  bool showSalaryError = false;
  bool showSkillsError = false;
  bool showSocialMediaError = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.height * 0.04,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppbar(
                  text: "Register",
                  icon: Icons.arrow_back_ios,
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const RegisterScreen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = const Offset(0.0, 1.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;
                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);
                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                ImageUpload(onImageSelected: (path) {
                  setState(() {
                    imagePath = path;
                  });
                }),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AboutField(aboutController: aboutController),
                      const SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Salary",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          SalaryField(
                            onChanged: (value) {
                              setState(() {
                                salary = value;
                              });
                            },
                            initialSalary: salary,
                          ),
                          if (showSalaryError)
                            Text("Please increase the salary",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: Colors.red)),
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
                                gender = value;
                              });
                            },
                            initialGender: gender,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          SkillsSelection(
                            onChanged: (selectedSkills) {
                              setState(() {
                                skills = selectedSkills;
                                showSkillsError = false;
                              });
                            },
                            initialSkills: const [],
                          ),
                          if (showSkillsError)
                            Text(
                              "Please add at least one skill",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.red),
                            ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          SocialMediaSelection(
                            onChanged: (selectedSocialMedia) {
                              setState(() {
                                _selectedSocialMedia.clear();
                                _selectedSocialMedia
                                    .addAll(selectedSocialMedia);
                                showSocialMediaError = false;
                                saveDataToSharedPreferences();
                              });
                            },
                          ),
                          if (showSocialMediaError)
                            Text(
                              "Please select at least one social media",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.red),
                            ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          CustomElevatedButton(
                            onPressed: _submitForm,
                            text: "Submit",
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

  void _submitForm() async {
    setState(() {
      showSalaryError = salary == 0;
      showSkillsError = skills.isEmpty;
      showSocialMediaError = !_selectedSocialMedia.containsValue(true);
    });
    if (!_formKey.currentState!.validate() ||
        showSalaryError ||
        showSkillsError ||
        showSocialMediaError) {
      return;
    }
    if (_formKey.currentState!.validate()) {
      await saveDataToSharedPreferences();
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  Future<void> saveDataToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('about', aboutController.text);
    prefs.setString('birthDate', birthDateController.text);
    prefs.setString('gender', gender);
    prefs.setStringList('skills', skills);
    prefs.setStringList('favorites', favorites);
    prefs.setDouble('salary', salary);
    prefs.setString('imagePath', imagePath);
    List<String> combinedSelectedItems = _selectedSocialMedia.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    prefs.setStringList('selectedSocialMedia', combinedSelectedItems);
  }
}
