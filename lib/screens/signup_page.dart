import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SIgnup'),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hint: Text('Email Address'),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hint: Text('Password'),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
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
