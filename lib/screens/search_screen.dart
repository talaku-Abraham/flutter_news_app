import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/providers/service_provider.dart';

class SearchScreen extends ConsumerWidget {
  SearchScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(repositoryProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 100,
            height: 30,
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
        ],
      ),
      // body:
      // state.when(
      //   data: (news) {
      //     if (news.latestArticles.isEmpty) {
      //       return Text("list empty");
      //     }
      //     final firstNews = news.latestArticles.first;
      //     return Column(
      //       children: [
      //         Text(firstNews.title),
      //         TextButton(onPressed: () {}, child: Text('seemore')),
      //       ],
      //     );
      //   },
      //   error: (error, stackTrace) => Text(error.toString()),
      //   loading: () => CircularProgressIndicator(),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed:
      //       () => ref.read(repositoryProvider.notifier).fetchLatestNews(),
      // ),
    );
  }
}
