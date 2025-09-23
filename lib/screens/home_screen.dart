import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/provider.dart';
import 'package:news_app/widgets/news_card.dart';

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
      ref.read(repositoryProvider.notifier).fetchEverything();
      ref.read(repositoryProvider.notifier).fetchLatestNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(repositoryProvider);
    print('inside home screen');

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.go('/home/search');
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: state.when(
              data: (news) {
                if (news.latestArticles.isEmpty) {
                  return Text("list empty");
                }
                final firstNews = news.latestArticles.first;
                return Column(
                  children: [
                    Text(firstNews.title),
                    TextButton(onPressed: () {}, child: Text('seemore')),
                  ],
                );
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => CircularProgressIndicator(),
            ),
          ),
          Expanded(
            child: state.when(
              data:
                  (news) => ListView.builder(
                    itemBuilder:
                        (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              ref
                                  .read(repositoryProvider.notifier)
                                  .fetchLatestNews();
                              context.go(
                                '/home/detail',
                                extra: news.articles[index],
                              );
                            },
                            child: NewsCard(
                              description: news.articles[index].description,
                              title: news.articles[index].title,
                              imageUrl: news.articles[index].urlToImage,
                              sourceName: news.articles[index].source,
                            ),
                          ),
                        ),

                    itemCount: news.articles.length,
                  ),
              error:
                  (error, stackTrace) => Center(child: Text('error : $error')),
              loading: () => Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => ref.read(repositoryProvider.notifier).fetchLatestNews(),
      ),
    );
  }
}
