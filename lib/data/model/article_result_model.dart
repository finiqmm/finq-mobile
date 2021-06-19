import 'package:finq/data/model/article_model.dart';

class ArticleResultModel {
  final List<ArticleModel> articles;

  ArticleResultModel({required this.articles});

  factory ArticleResultModel.fromJson(List<dynamic> parsedJson) =>
      ArticleResultModel(
          articles: parsedJson.map((e) => ArticleModel.fromJson(e)).toList());
}
