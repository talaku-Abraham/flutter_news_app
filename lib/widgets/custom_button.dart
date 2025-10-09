import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onTab});

  final String label;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kPadding),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            const Color.fromARGB(255, 211, 231, 229),
          ),
          shape: WidgetStateProperty.all(LinearBorder()),
          padding: WidgetStateProperty.all(EdgeInsets.all(kPadding)),
        ),
        onPressed: onTab,
        child: Text(label, style: TextStyle(fontSize: 16, color: Colors.black)),
      ),
    );
  }
}
