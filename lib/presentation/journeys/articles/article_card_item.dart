import 'package:cached_network_image/cached_network_image.dart';
import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/common/extension/date_formatter.dart';
import 'package:finq/domain/entities/article_entity.dart';
import 'package:finq/presentation/journeys/articles/widget_items/article_cover_photo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widget_items/article_info_row.dart';

class ArticleCardItem extends StatelessWidget {
  final ArticleEntity article;

  ArticleCardItem({required this.article});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(RouteList.article_detail, arguments: article),
      child: Container(
        height: 180,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: [
            Hero(
                tag: 'coverphoto',
                child: ArticlCoverPhoto(coverPhotoUrl: article.coverPhoto!)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.red),
                      child: Text(
                        article.categoryName ?? 'General',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                    Text(
                      article.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ArticleInfoRow(
                        publisherName: article.publisherName ?? "",
                        itemColor: Colors.white,
                        createdDate: article.createdDate ?? 0)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
