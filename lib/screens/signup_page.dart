import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/providers/firebase_provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final container = ProviderScope.containerOf(context);
    final userDao = container.read(userDaoProvider);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signup'),
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Email Address';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hint: Text('Email Address'),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Password';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hint: Text('Password'),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final result = userDao.signUp(
                        _emailController.text,
                        _passwordController.text,
                      );
                      print('creating user');
                      result.then((value) => print(value.toString()));
                    }
                  },
                  child: Text('Sign Up'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => context.go('/login'),
                  child: Text('LogIn'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
