import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/image.dart';
import 'package:task_kafel_company/view/screens/home/home_screen.dart';
import 'package:task_kafel_company/view/widgets/custom_appbar.dart';
import 'package:task_kafel_company/view/widgets/custom_button.dart';
import 'package:task_kafel_company/view/widgets/custom_rich_text_inlogin.dart';
import 'package:task_kafel_company/view/widgets/email_widget.dart';
import 'package:task_kafel_company/view/widgets/password_field.dart';
import 'package:task_kafel_company/view/widgets/remember_forget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.height * 0.04,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppbar(
                  text: "Account Login",
                  icon: Icons.arrow_back_ios,
                ),
                const SizedBox(height: 24),
                Image.asset(ImageApp.loginImage),
                const SizedBox(height: 24),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      EmailField(controller: emailController),
                      const SizedBox(height: 20),
                      PasswordField(controller: passwordController),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const RememberAndForgetWidget(),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  text: "Login",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                const RichTextWithInkWell(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
