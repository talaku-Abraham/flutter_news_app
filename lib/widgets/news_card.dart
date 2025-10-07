import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String title;
  // final String imageUrl;
  final String description;
  final String sourceName;
  const NewsCard({
    super.key,
    required this.description,
    required this.title,
    // required this.imageUrl,
    this.sourceName = "BBC",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          maxLines: 2,
        ),
        // Text(description, overflow: TextOverflow.ellipsis, maxLines: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSource(sourceName),
            // Spacer(),
            SizedBox(width: 8),
            _buildReleaseTime(),
          ],
        ),
      ],
    );
  }
}

Widget _buildImage(String imageUrl) {
  return SizedBox(
    height: 80,

    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.network(
          imageUrl,
          errorBuilder: (context, error, stackTrace) => Icon(Icons.image),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget _buildSource(String title) {
  return Row(
    children: [
      Icon(Icons.public),
      Text(title, overflow: TextOverflow.ellipsis),
    ],
  );
}

Widget _buildReleaseTime() {
  return Row(
    children: [
      Icon(Icons.access_time),
      Text('14m ago', maxLines: 1, overflow: TextOverflow.ellipsis),
    ],
  );
}
