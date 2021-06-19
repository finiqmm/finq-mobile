part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticleLoadingState  extends ArticleState {}

class ArticleLoadedState extends ArticleState {
  final List<ArticleEntity> articles;

  ArticleLoadedState({required this.articles}) : super();

  @override
  List<Object> get props => [articles];
}

class ArticleErrorState extends ArticleState {
  final String errorMessage;

  ArticleErrorState({required this.errorMessage}) : super();

  @override
  List<Object> get props => [errorMessage];
}
