import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_kafel_company/constant/image.dart';
import 'package:task_kafel_company/constant/my_theme.dart';
import 'package:task_kafel_company/view/screens/auth/login/login_screen.dart';
import 'package:task_kafel_company/view/screens/auth/register/second_register_screen.dart';
import 'package:task_kafel_company/view/widgets/confirm_password.dart';
import 'package:task_kafel_company/view/widgets/custom_appbar.dart';
import 'package:task_kafel_company/view/widgets/custom_button.dart';
import 'package:task_kafel_company/view/widgets/email_widget.dart';
import 'package:task_kafel_company/view/widgets/first_last_name_register.dart';
import 'package:task_kafel_company/view/widgets/password_field.dart';
import 'package:task_kafel_company/view/widgets/user_type.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _showErrorMessage = false;
  String _selectedUserType = '';
  double salary = 0.0;
  List<String> skills = [];
  List<String> favorites = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.whiteColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.height * 0.04,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(
                  text: "Register",
                  icon: Icons.arrow_back_ios,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const LoginScreen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = const Offset(0.0, 1.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
                if (_showErrorMessage)
                  Container(
                    color: const Color(0xffFFF0ED),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Color(0xffF56342),
                        ),
                        const SizedBox(width: 12),
                        Text('Fill the required fields',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xffF56342))),
                      ],
                    ),
                  ),
                const SizedBox(height: 24),
                Center(child: Image.asset(ImageApp.groupImage)),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FirstLastNameTextField(
                        firstNameController: _firstNameController,
                        lastNameController: _lastNameController,
                      ),
                      const SizedBox(height: 30),
                      EmailField(controller: _emailController),
                      const SizedBox(height: 30),
                      PasswordField(controller: _passwordController),
                      const SizedBox(height: 30),
                      ConfirmPasswordField(
                        controller: _confirmPasswordController,
                        passwordController: _passwordController,
                      ),
                      const SizedBox(height: 30),
                      UserType(
                        onChanged: (value) {
                          setState(() {
                            _selectedUserType = value;
                          });
                        },
                        initialUserType: '',
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: CustomElevatedButton(
                          onPressed: _validateAndNavigate,
                          text: "Next",
                        ),
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

  void _validateAndNavigate() async {
    if (_formKey.currentState!.validate()) {
      await saveRegistrationData();
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SecondRegisterScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    } else {
      setState(() {
        _showErrorMessage = true;
      });
    }
  }

  Future<void> saveRegistrationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', _emailController.text);
    prefs.setString('firstName', _firstNameController.text);
    prefs.setString('lastName', _lastNameController.text);
    prefs.setString('password', _passwordController.text);
    prefs.setString('userType', _selectedUserType);
    prefs.setDouble('salary', salary);
    prefs.setStringList('skills', skills);
    prefs.setStringList('favorites', favorites);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
