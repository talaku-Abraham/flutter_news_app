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
  const TopStory({super.key, required this.articles});

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => context.go('/home/detail', extra: articles),
        child: Card(
          color: Theme.of(context).colorScheme.surface,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          margin: EdgeInsets.all(kMargin),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BuildImage(imageUrl: articles.first.urlToImage),
                _buildTitle(articles.first.title, context),
                // SizedBox(height: kPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconWithText(
                      icon: Icons.public,
                      title: articles.first.source,
                    ),
                    SizedBox(width: 5),
                    IconWithText(title: '14 mins', icon: Icons.access_time),
                  ],
                ),
                Align(
                  alignment: AlignmentGeometry.bottomRight,
                  child: CustomButton(
                    label: 'See More',
                    onTap: () {
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

  Widget _buildTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
