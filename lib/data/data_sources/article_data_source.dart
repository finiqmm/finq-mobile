import 'package:finq/data/core/api_client.dart';
import 'package:finq/data/model/article_model.dart';
import 'package:finq/data/model/article_result_model.dart';

abstract class ArticleDataSource {
  Future<List<ArticleModel>> getArticles();
}

class ArticleDataSourceImpl extends ArticleDataSource {
  final ApiClient _apiClient;

  ArticleDataSourceImpl(this._apiClient);

  @override
  Future<List<ArticleModel>> getArticles() async {
    final response = await _apiClient.get();
    final articleResultModel = ArticleResultModel.fromJson(response);
    return articleResultModel.articles;
  }
}
