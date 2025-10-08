import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/providers/firebase_provider.dart';

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

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LogIn'),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'email',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter email address';
                }
                return null;
              },
            ),

            SizedBox(height: 20),

            TextFormField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'password',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a password';
                }
                return null;
              },
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final result = userDao.login(
                        _emailController.text,
                        _passwordController.text,
                      );
                    }
                  },
                  child: Text('LogIn'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    print('clicked');
                    GoRouter.of(context).go("/signup");
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
