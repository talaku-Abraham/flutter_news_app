import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/components/build_image.dart';
import 'package:news_app/components/build_social_signin_button.dart';
import 'package:news_app/components/build_text_form_field.dart';
import 'package:news_app/providers/firebase_provider.dart';
import 'package:news_app/widgets/custom_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  FutureOr<void> logIn(String password, String email) {}

  @override
  Widget build(BuildContext context) {
    final container = ProviderScope.containerOf(context);
    final userDao = container.read(userDaoProvider);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginImage(
                height: size.height * 0.4,
                imageUrl: 'assets/images/logo.jpg',
              ),
              SizedBox(height: size.height * 0.05),

              BuildTextFormField(
                controller: _emailController,
                hintText: 'Email Address',
              ),
              SizedBox(height: size.height * 0.01),

              // SizedBox(height: size.height * 0.01),
              BuildTextFormField(
                controller: _passwordController,
                hintText: 'password',
                obscureText: true,
              ),

              CustomButton(
                label: 'Login',
                onTab: () async {
                  await userDao.login(
                    _emailController.text,
                    _passwordController.text,
                  );
                },
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BuildSocialSigninbutton(
                    height: size.width * 0.05,
                    imageUrl: 'assets/images/google.png',
                    onTap: () {},
                  ),
                  BuildSocialSigninbutton(
                    height: size.width * 0.05,
                    imageUrl: 'assets/images/facebook.png',
                    onTap: () {},
                  ),
                  BuildSocialSigninbutton(
                    height: size.width * 0.05,
                    imageUrl: 'assets/images/twitter.png',
                    onTap: () => context.go('/signup'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
