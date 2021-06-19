import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/article_entity.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/repositories/article_repository.dart';
import 'package:finq/domain/usecases/use_case.dart';

class GetArticle extends UseCase<List<ArticleEntity>, NoParams> {
  final ArticleRepository articleRepository;

  GetArticle(this.articleRepository);

  @override
  Future<Either<AppError, List<ArticleEntity>>> call(NoParams params) {
    return articleRepository.getArticles();
  }
}
