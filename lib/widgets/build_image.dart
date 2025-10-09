import 'package:flutter/widgets.dart';

class BuildImage extends StatelessWidget {
  final String imageUrl;

  const BuildImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(imageUrl, fit: BoxFit.cover),
      ),
    );
    ;
  }
}
