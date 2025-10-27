import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kPadding),
      child: TextButton(
        style: Theme.of(context).outlinedButtonTheme.style,

        onPressed: onTap,
        child: Text(label, style: TextStyle(fontSize: 20, color: Colors.black)),
      ),
    );
  }
}
