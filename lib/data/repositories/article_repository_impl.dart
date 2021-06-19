import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:finq/data/data_sources/article_data_source.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/article_entity.dart';
import 'package:finq/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final ArticleDataSource articleDataSource;

  ArticleRepositoryImpl(this.articleDataSource);

  @override
  Future<Either<AppError, List<ArticleEntity>>> getArticles() async {
    try {
      final articles = await articleDataSource.getArticles();
      return Right(articles);
    } on SocketException {
      return Left(AppError(AppErrorType.network, 'No internet connection'));
    } on Exception {
      return Left(AppError(AppErrorType.network, 'Network Error.Try again'));
    }
  }
}
