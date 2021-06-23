import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:finq/data/data_sources/article_data_source.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/article_entity.dart';
import 'package:finq/domain/repositories/article_repository.dart';
import 'package:flutter/material.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final ArticleDataSource articleDataSource;

  ArticleRepositoryImpl(this.articleDataSource);

  @override
  Future<Either<AppError, List<ArticleEntity>>> getArticles() async {
    try {
      final articles = await articleDataSource.getArticles();
      debugPrint('fetching article');

      return Right(articles);
    } on SocketException {
      debugPrint('SocketException');
      return Left(AppError(AppErrorType.network, 'No internet connection'));
    } on Exception {
      debugPrint('Exception');

      return Left(AppError(AppErrorType.network, 'Network Error.Try again'));
    }
  }
}
