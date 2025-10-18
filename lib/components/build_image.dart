import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  const LoginImage({super.key, required this.imageUrl, required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        imageUrl,
        // width: size.height * 0.5,
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }
}
