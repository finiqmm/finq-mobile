import 'package:finq/domain/entities/article_entity.dart';
import 'package:finq/presentation/journeys/articles/widget_items/article_cover_photo.dart';
import 'package:finq/presentation/journeys/articles/widget_items/article_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ArticleDetaiScreen extends StatelessWidget {
  final ArticleEntity article;
  ArticleDetaiScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          Hero(
              tag: 'coverphoto',
              child: ArticlCoverPhoto(coverPhotoUrl: article.coverPhoto!)),
          Text(
            article.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ArticleInfoRow(
                  publisherName: article.publisherName ?? "",
                  itemColor: Colors.black,
                  createdDate: article.createdDate ?? 0)),
          Html(
            data: article.body,
          )
        ],
      ),
    );
  }
}
