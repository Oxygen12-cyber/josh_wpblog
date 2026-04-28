import 'package:flutter/material.dart';
import 'package:josh_wpblog/components/newscard.dart';
import 'package:josh_wpblog/data/data.dart';
import 'package:josh_wpblog/services/apiservice/api.dart';
import 'package:wordpress_client/wordpress_client.dart';
import 'dart:math';

class CustomTabView extends StatefulWidget {
  const CustomTabView({super.key});

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  List<Post> postsData = [];
  bool isLoading = true;
  final random = Random();

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    final data = await fetchPostWithClient(true);
    setState(() {
      postsData = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (postsData.isEmpty) {
      return RefreshIndicator(
        onRefresh: () => _loadPosts(),
        color: Colors.black,
        backgroundColor: Colors.amber,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: const Center(child: Text('No posts found. Pull to refresh.')),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => _loadPosts(),
      color: Colors.black,
      backgroundColor: Colors.amber,
      child: ListView.builder(
        itemCount: postsData.length,
        itemBuilder: (context, index) {
          final String randomProfileImg =
              profileImages[random.nextInt(profileImages.length)];
          final String randomRichImg =
              richImages[random.nextInt(richImages.length)];

          final article = postsData[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 0),
            child: NewsCard(
              // Use placeholder images/categories for now, or replace with actual `article` properties if available
              imageUrl: randomRichImg,
              category: 'News',
              title: article.title?.parsedText ?? 'No Title',
              authorName: article.excerpt?.parsedText ?? 'adeola',
              authorAvatarUrl: randomProfileImg, // Placeholder avatar
              timeText:
                  article.date?.toIso8601String().split('T').first ??
                  '', // e.g. '2023-11-20'
              content: article.content?.parsedText ?? 'No Content',
              preTitle: '',
            ),
          );
        },
      ),
    );
  }
}
