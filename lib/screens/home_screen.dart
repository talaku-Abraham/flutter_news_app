import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/custom_drawer.dart';
import 'package:news_app/providers/firebase_provider.dart';

import 'package:news_app/providers/service_provider.dart';
import 'package:news_app/widgets/news_preview_card.dart';
import 'package:news_app/widgets/top_story.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(newsNotifierProvider.notifier).fetchEverything();
      ref.read(latestNewsNotifierProvider.notifier).fetchLatestNews();
      // ref
      //     .read(newsNotifierByCategoryProvider.notifier)
      //     .fetchNewsByCategory('sports');
    });
  }

  @override
  Widget build(BuildContext context) {
    final latestNews = ref.watch(latestNewsNotifierProvider);
    // final latestNews = ref.watch(newsNotifierByCategoryProvider);
    final newsState = ref.watch(newsNotifierProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: CustomDrawer(),
      appBar: AppBar(
        // backgroundColor: Theme.of(context).highlightColor,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(userDaoProvider).logOut();
            },
            icon: Icon(Icons.login_outlined),
          ),
        ],
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            latestNews.when(
              data:
                  (articles) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Latest News",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      TopStory(articles: articles),
                    ],
                  ),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => Center(child: CircularProgressIndicator()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Jump Right in",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            newsState.when(
              data:
                  (news) => Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder:
                          (context, index) =>
                              NewsPreviewCard(article: news[index]),
                      itemCount: newsState.value!.length,
                    ),
                  ),
              error:
                  (error, stackTrace) => Center(child: Text(error.toString())),
              loading: () => Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ), // SafeArea(child: _buildCustomScrollView()),
    );
    //  Scaffold(
    //   appBar: AppBar(
    //     actions: [
    //       IconButton(
    //         onPressed: () {
    //           ref.read(userDaoProvider).logOut();
    //         },
    //         icon: Icon(Icons.login_outlined),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           children: [
    //             Icon(Icons.search),
    //             SizedBox(
    //               width: 100,
    //               height: 30,
    //               child: TextFormField(
    //                 decoration: InputDecoration(border: OutlineInputBorder()),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    //   body: SafeArea(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           "Latest",
    //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //         ),
    //         latestNewsState.when(
    //           data: (data) => TopStory(article: latestNewsState.value!.first),
    //           error:
    //               (error, stackTrace) => Center(child: Text(error.toString())),
    //           loading: () => Center(child: CircularProgressIndicator()),
    //         ),
    //         Text(
    //           "Hot News",
    //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //         ),
    //         SizedBox(
    //           height: 400,
    //           child: newsState.when(
    //             data:
    //                 (data) => ListView.builder(
    //                   itemBuilder:
    //                       (context, index) =>
    //                           NewsPreviewCard(article: newsState.value![index]),
    //                   itemCount: newsState.value!.length,
    //                 ),
    //             error:
    //                 (error, stackTrace) =>
    //                     Center(child: Text(error.toString())),
    //             loading: () => Center(child: CircularProgressIndicator()),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
