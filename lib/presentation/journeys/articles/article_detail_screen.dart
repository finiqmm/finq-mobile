import 'package:finq/domain/entities/article_entity.dart';
import 'package:flutter/material.dart';

class ArticleDetaiScreen extends StatelessWidget {
  final ArticleEntity article;
  ArticleDetaiScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(article.title),
      ),
    );
  }
}
