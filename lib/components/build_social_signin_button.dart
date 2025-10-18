import 'package:flutter/material.dart';

class BuildSocialSigninbutton extends StatelessWidget {
  final String imageUrl;
  final double height;
  final VoidCallback onTap;

  const BuildSocialSigninbutton({
    super.key,
    required this.imageUrl,
    required this.onTap,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: BoxBorder.all()),
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(imageUrl, height: height, fit: BoxFit.cover),
      ),
    );
  }
}
