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
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder:
              (context, error, stackTrace) => Image.network(
                "https://media.gettyimages.com/id/166025443/photo/opened-book-on-top-of-stack-of-blue-books-knowledge.jpg?s=2048x2048&w=gi&k=20&c=6TocveHIHjrMfGY5Vg7ZE8UPalOkTw8h7S9bgx2ArwU=",
                fit: BoxFit.cover,
              ),
        ),
      ),
    );
    ;
  }
}
