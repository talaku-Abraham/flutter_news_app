import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:news_app/providers/firebase_provider.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/widgets/build_image.dart';
import 'package:news_app/widgets/custom_button.dart';
import 'package:news_app/widgets/icon_with_text.dart';
import 'package:url_launcher/url_launcher.dart';

String formatTimeStamp(String isoDateString) {
  try {
    final date = DateTime.parse(isoDateString);
    print(date.toString());

    return DateFormat.yMMMd().add_j().format(date.toLocal());
  } catch (e) {
    print(e);

    throw Exception("date time is wrong");
  }
}

Future<void> openArticle(String url) async {
  final uri = Uri.parse(url);
  // if (await canLaunchUrl(uri)) {
  await launchUrl(uri, webOnlyWindowName: '_blank');
  // } else {
  //   throw 'can not launch $uri';
  // }
}

class DetailScreen extends ConsumerWidget {
  final Article article;
  // final String imageUrl;
  // "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  const DetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteDao = ref.watch(favoriteDaoProvider);
    final userDao = ref.watch(userDaoProvider);

    return Scaffold(
      appBar: AppBar(title: Text("News", style: TextStyle())),
      body: Container(
        // elevation: 3,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(kBorderRadius),
        // ),
        margin: EdgeInsets.all(kPadding),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: BuildImage(imageUrl: article.urlToImage)),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatTimeStamp(article.publishedAt)),
                        IconWithText(icon: Icons.public, title: article.source),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      article.title,
                      // "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(height: 20),
                    Text(
                      // " lum fermentum urna pretium congue. In nec velit sit amet eros porta volutpat. Maecenas lobortis massa sed aliquam fringilla. Vestibulum interdum mauris libero, non accumsan lectus venenatis vel. Suspendisse quis efficitur ligula. Aenean eget scelerisque nunc, ac porttitor tellus. Vivamus porttitor efficitur massa vitae pulvinar. Nunc egestas eros dignissim, ultrices sapien et, convallis diam. Nulla laoreet, nisl ut dignissim hendrerit, nisi felis lacinia tortor, vitae vehicula quam mi vel nunc. Praesent tincidunt sem vel diam convallis viverra. Donec pellentesque leo nec quam tristique bibendum. Donec ligula ligula, dictum eget tortor nec, viverra molestie libero. ULorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce volutpat nibh ut sodales finibus. Praesent eget condimentum nulla. Proin dignissim lacinia dictum. Morbi interdum tincidunt cursus. Curabitur a molestie diam, in tristique ante. Fusce in congue ex. Sed sed volutpat eros. Ut non diam aliquet, condimentum libero et, mattis purus. Nam laoreet finibus est in consectetur. Aenean eget erat posuere, pellentesque nulla eu, tincidunt nisl. Vivamus nec tristiqu ",
                      article.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 15,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      label: 'Read More',
                      onTap: () => openArticle(article.url),
                    ),
                    IconButton(
                      onPressed: () {
                        favoriteDao.addFavorite(userDao.userId()!, article.url);
                      },
                      icon: Icon(Icons.favorite),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
