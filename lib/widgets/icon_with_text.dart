import 'package:flutter/widgets.dart';
import 'package:news_app/constants.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: kIconSize),
        SizedBox(width: 2),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
    ;
  }
}
