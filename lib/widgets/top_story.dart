import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/providers/service_provider.dart';
import 'package:news_app/widgets/build_image.dart';
import 'package:news_app/widgets/custom_button.dart';
import 'package:news_app/widgets/icon_with_text.dart';

class TopStory extends StatelessWidget {
  const TopStory({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => context.go('/home/detail', extra: article),
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
                BuildImage(imageUrl: article.urlToImage),
                _buildTitle(article.title),
                Padding(
                  padding: const EdgeInsets.only(
                    left: kPadding,
                    right: kPadding,
                  ),
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
                  child: CustomButton(
                    label: 'See More',
                    onTab: () {
                      final container = ProviderScope.containerOf(context);
                      final articles =
                          container
                              .read(latestNewsNotifierProvider.notifier)
                              .fetchLatestNews();

                      context.go('/home/latest', extra: articles);
                    },
                  ),
                ),
              ],
            ),
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
