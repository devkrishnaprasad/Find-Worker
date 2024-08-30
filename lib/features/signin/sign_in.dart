import 'dart:developer';

import 'package:find_worker/utils/colors.dart';
import 'package:find_worker/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController paswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.13,
              ),
              titleWidget(),
              singinForm(),
              forgotPasswordWidget(width),
              const SizedBox(height: 40),
              signinOptions(),
              const SizedBox(height: 40),
              registerWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Center registerWidget() {
    return Center(
      child: Text.rich(
        TextSpan(
          text: "Haven't an account? ",
          style: labelText.copyWith(color: shadowColor),
          children: <TextSpan>[
            TextSpan(
              text: 'Sign Up',
              style: labelText.copyWith(color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  Column signinOptions() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/vectors/google_ic.svg',
                ),
              ),
            ),
            const SizedBox(width: 40),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  'assets/vectors/apple_ic.svg',
                ),
              ),
            ),
            const SizedBox(width: 40),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/vectors/facebook_ic.svg',
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Column forgotPasswordWidget(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Forgot Password?',
            style: labelText.copyWith(color: primaryColor),
          ),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * 0.3,
              child: const Divider(),
            ),
            Text(
              'Or continue with',
              style: labelText.copyWith(color: shadowColor),
            ),
            SizedBox(
              width: width * 0.3,
              child: const Divider(),
            ),
          ],
        )
      ],
    );
  }

  Column titleWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back 👋',
          style: mainTitle,
        ),
        Text(
          'Let’s log in. Apply to jobs!',
          style: labelText,
        ),
      ],
    );
  }

  Form singinForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 40),
          TextFormField(
            style: labelText,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'E-mail',
              hintStyle: labelText.copyWith(color: shadowColor),
              prefixIcon: Image.asset('assets/icons/mail_ic.png'),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter email';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            style: labelText,
            controller: paswordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: labelText.copyWith(color: shadowColor),
              prefixIcon: Image.asset('assets/icons/password_ic.png'),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                log('Email : ${emailController.text}');
                log('Password : ${paswordController.text}');
              }
            },
            child: const Text('Log in'),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
