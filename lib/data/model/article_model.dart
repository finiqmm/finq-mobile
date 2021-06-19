import 'package:finq/domain/entities/article_entity.dart';

class ArticleModel extends ArticleEntity {
  final int id;
  final String title;
  final String body;
  final String? coverPhoto;
  final String? publisherName;
  final String? categoryName;
  final int? createdDate;

  ArticleModel(
      {required this.id,
      required this.title,
      required this.body,
      required this.publisherName,
      this.coverPhoto,
      this.categoryName,
      this.createdDate})
      : super(
            id: id,
            body: body,
            publisherName: publisherName,
            title: title,
            categoryName: categoryName,
            coverPhoto: coverPhoto,
            createdDate: createdDate);

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
      id: json["id"],
      title: json["title"],
      body: json["body"],
      publisherName: json["publisher_name"],
      categoryName: json["category_name"],
      coverPhoto: json["cover_photo"],
      createdDate: json["create_date"]);

  Map<String, dynamic> toJson(ArticleModel article) {
    final Map<String, dynamic> json = Map<String, dynamic>();
    json['id'] = article.id;
    json['title'] = article.title;
    json['body'] = article.body;
    json['publisher_name'] = article.publisherName;
    json['category_name'] = article.categoryName;
    json['cover_photo'] = article.coverPhoto;
    json['create_date'] = article.createdDate;

    return json;
  }
}
