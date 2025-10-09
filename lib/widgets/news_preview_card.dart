import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/widgets/build_image.dart';
import 'package:news_app/widgets/icon_with_text.dart';

class NewsPreviewCard extends StatelessWidget {
  const NewsPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/home/detail'),
      child: Card(
        elevation: 2,
        // margin: EdgeInsets.all(kMargin),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8.0),
                      child: BuildImage(
                        imageUrl:
                            "https://media.gettyimages.com/id/166025443/photo/opened-book-on-top-of-stack-of-blue-books-knowledge.jpg?s=2048x2048&w=gi&k=20&c=6TocveHIHjrMfGY5Vg7ZE8UPalOkTw8h7S9bgx2ArwU=",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Shows more vertical content, good for portraits",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconWithText(icon: Icons.public, title: 'BBC'),
                            SizedBox(width: 2),
                            IconWithText(
                              icon: Icons.access_time,
                              title: '10 mins',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
