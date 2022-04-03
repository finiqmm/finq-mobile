import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<Either<AppError,List<ArticleEntity>>> getArticles();
}
