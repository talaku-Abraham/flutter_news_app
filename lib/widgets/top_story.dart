import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/widgets/build_image.dart';
import 'package:news_app/widgets/custom_button.dart';
import 'package:news_app/widgets/icon_with_text.dart';

class TopStory extends StatelessWidget {
  const TopStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        margin: EdgeInsets.all(kMargin),
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Column(
            children: [
              BuildImage(
                imageUrl:
                    "https://media.gettyimages.com/id/166025443/photo/opened-book-on-top-of-stack-of-blue-books-knowledge.jpg?s=2048x2048&w=gi&k=20&c=6TocveHIHjrMfGY5Vg7ZE8UPalOkTw8h7S9bgx2ArwU=",
              ),
              _buildTitle(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              ),
              Padding(
                padding: const EdgeInsets.only(left: kPadding, right: kPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconWithText(icon: Icons.public, title: 'BBC'),
                    SizedBox(width: 5),
                    IconWithText(title: '14 mins', icon: Icons.access_time),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentGeometry.bottomRight,
                child: CustomButton(label: 'See More', onTab: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
