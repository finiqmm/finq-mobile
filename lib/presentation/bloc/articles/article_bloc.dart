import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/article_entity.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/usecases/article/get_article.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticle getArticle;

  ArticleBloc(this.getArticle) : super(ArticleInitial());

  @override
  Stream<ArticleState> mapEventToState(
    ArticleEvent event,
  ) async* {
    if (event is ArticleLoadEvent) {
      yield ArticleLoadingState();
      final response = await getArticle(NoParams());
      yield response.fold((l) => ArticleErrorState(errorMessage: l.message),
          (r) => ArticleLoadedState(articles: r));
    }
  }
}
