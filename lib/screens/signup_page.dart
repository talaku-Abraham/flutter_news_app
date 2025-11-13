import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/components/build_image.dart';
import 'package:news_app/components/build_social_signin_button.dart';
import 'package:news_app/components/build_text_form_field.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/providers/firebase_provider.dart';
import 'package:news_app/widgets/custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
  }

  bool _isScreenLarge(double width) {
    return width > 600 ? true : false;
  }

  Widget _buildLandScapeMode(Size size) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: size.width * 0.1),
            child: Center(
              child: LoginImage(
                height: size.height * 0.6,
                imageUrl: 'assets/images/logo.jpg',
              ),
            ),
          ),
        ),
        SizedBox(width: size.width * 0.1),
        SizedBox(
          width: size.width * 0.3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text("data"),
              BuildTextFormField(
                controller: _emailController,
                hintText: 'email',
              ),
              SizedBox(height: size.height * 0.01),
              BuildTextFormField(
                controller: _passwordController,
                hintText: 'password',
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              //   child: TextFormField(
              //     obscureText: true,
              //     controller: _passwordController,
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Enter Password';
              //       }
              //       return null;
              //     },
              //     decoration: InputDecoration(
              //       // border: OutlineInputBorder(),
              //       hint: Text('Password'),
              //     ),
              //   ),
              // ),
              CustomButton(label: 'Sign Up', onTap: () {}),
              SizedBox(height: size.height * 0.05),
              _buildSignInText(),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BuildSocialSigninbutton(
                    height: size.width * 0.02,
                    imageUrl: 'assets/images/google.png',
                    onTap: () {},
                  ),
                  BuildSocialSigninbutton(
                    height: size.width * 0.02,
                    imageUrl: 'assets/images/facebook.png',
                    onTap: () {},
                  ),
                  BuildSocialSigninbutton(
                    height: size.width * 0.02,
                    imageUrl: 'assets/images/twitter.png',
                    onTap: () => context.go('/login'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildFooterText(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFooterText() {
    return Text(
      'By signing to News24 you are accepting our Terms & Conditions',
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  Widget _buildSignInText() {
    return Text(
      '___________ or sign in with _____________',
      maxLines: 1,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w300,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildPortrait(Size size) {
    return Column(
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
        ),
        CustomButton(
          label: 'Sign Up',
          onTap: () {
            if (_formKey.currentState!.validate()) {
              // final result = userDao.signUp(
              //   _emailController.text,
              //   _passwordController.text,
              // );

              // result.then((value) => print(value.toString()));
            }
          },
        ),

        SizedBox(height: size.height * 0.05),
        _buildSignInText(),
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
              onTap: () => context.go('/login'),
            ),
          ],
        ),
        SizedBox(height: 20),
        _buildFooterText(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final container = ProviderScope.containerOf(context);
    final userDao = container.read(userDaoProvider);

    final size = MediaQuery.of(context).size;

    final isScreenBig = _isScreenLarge(size.width);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: isScreenBig ? _buildLandScapeMode(size) : _buildPortrait(size),
        ),
      ),
    );
  }
}
