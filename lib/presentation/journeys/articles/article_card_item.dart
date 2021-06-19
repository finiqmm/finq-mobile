import 'package:cached_network_image/cached_network_image.dart';
import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/common/extension/date_formatter.dart';
import 'package:finq/domain/entities/article_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticleCardItem extends StatelessWidget {
  final ArticleEntity article;

  ArticleCardItem({required this.article});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(RouteList.article_detail,arguments: article),
      child: Container(
        height: 180,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white.withOpacity(0.3), Colors.black])),
                child: CachedNetworkImage(
                  placeholder: (context, url) {
                    return Center(child: CircularProgressIndicator());
                  },
                  imageUrl: article.coverPhoto!,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.userAlt,
                          color: Colors.white,
                          size: 12,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          article.publisherName ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Icon(
                          FontAwesomeIcons.clock,
                          color: Colors.white,
                          size: 12,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          DateFormatter.convertMillisecondToString(
                              milliSecond: article.createdDate),
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    )
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
