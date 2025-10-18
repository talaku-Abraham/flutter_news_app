import 'package:flutter/material.dart';

class BuildTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const BuildTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'can not be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          // border: InputBorder.,
          // contentPadding: EdgeInsets.all(30),
          hint: Text(hintText),
        ),
      ),
    );
    ;
  }
}
