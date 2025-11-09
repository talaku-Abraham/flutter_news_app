import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
            title: Text("sources"),
            onTap: () {
              context.go('/home/source');
            },
          ),
          // call
          ListTile(
            leading: Icon(Icons.sports),
            title: Text("Sports"),
            onTap: () {
              context.go('/home/category', extra: 'sports');
            },
          ),
          ListTile(
            leading: Icon(Icons.movie),
            title: Text("Entertainment"),
            onTap: () {
              context.go('/home/category', extra: 'entertainment');
            },
          ),
          ListTile(
            leading: Icon(Icons.science),
            title: Text("science"),
            onTap: () {
              context.go('/home/category', extra: 'science');
            },
          ),
          ListTile(
            leading: Icon(Icons.health_and_safety_outlined),
            title: Text("health"),
            onTap: () {
              context.go('/home/category', extra: 'health');
            },
          ),
          ListTile(
            leading: Icon(Icons.health_and_safety_outlined),
            title: Text("Technology"),
            onTap: () {
              context.go('/home/category', extra: 'technology');
            },
          ),
        ],
      ),
    );
  }
}
