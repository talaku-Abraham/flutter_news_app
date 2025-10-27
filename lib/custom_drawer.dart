import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/category_news_notifier.dart';
import 'package:news_app/providers/service_provider.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref
    //     .watch(categoryNewsNotifierProvider.notifier)
    //     .fetchNewsByCategory('sports');
    // final refState = ref.watch(categoryNewsNotifierProvider);

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(decoration: BoxDecoration(), child: Text("My drawer")),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {},
          ),
          // call
          ListTile(
            leading: Icon(Icons.sports),
            title: Text("Sports"),
            onTap: () {
              context.go('/home/latest', extra: 'sports');
            },
          ),
          ListTile(
            leading: Icon(Icons.abc),
            title: Text("Entertainment"),
            onTap: () {
              context.go('/home/latest', extra: 'entertainment');
            },
          ),
        ],
      ),
    );
  }
}
