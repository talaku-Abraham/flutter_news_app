import 'package:flutter/material.dart';
import 'package:news_app/data/model/article.dart';

class DetailScreen extends StatelessWidget {
  final Article article;
  final imageurl =
      "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  const DetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News", style: TextStyle())),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Image.network(
                  imageurl,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Text(DateTime.now().toString()),
          Text(
            "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: 20),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce volutpat nibh ut sodales finibus. Praesent eget condimentum nulla. Proin dignissim lacinia dictum. Morbi interdum tincidunt cursus. Curabitur a molestie diam, in tristique ante. Fusce in congue ex. Sed sed volutpat eros. Ut non diam aliquet, condimentum libero et, mattis purus. Nam laoreet finibus est in consectetur. Aenean eget erat posuere, pellentesque nulla eu, tincidunt nisl. Vivamus nec tristiqu ",
          ),
          SizedBox(height: 20),
          TextButton(onPressed: () {}, child: Text("read more")),
        ],
      ),
    );
  }
}
