import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/article_entity.dart';
import 'package:finq/presentation/bloc/articles/article_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late ArticleBloc sut;
  late MockGetArticle mockGetArticle;

  setUp(() {
    mockGetArticle = MockGetArticle();
    sut = ArticleBloc(mockGetArticle);
  });

  group('ArticleLoadEvent', () {
    blocTest<ArticleBloc, ArticleState>(
      'emits ArticleLoadingState and then ArticleLoadedState on success',
      build: () => sut,
      act: (sut){
        when(mockGetArticle(any)).thenAnswer((_)async => Right(<ArticleEntity>[]));
        sut.add(ArticleLoadEvent());
      },expect: () =>  [
        isA<ArticleLoadingState>(),
        isA<ArticleLoadedState>()
      ]
    );

    blocTest<ArticleBloc, ArticleState>(
      'emits ArticleLoadingState and then ArticleErrorState on failure',
      build: () => sut,
      act: (sut){
        when(mockGetArticle(any)).thenAnswer((_)async => Left(AppError(AppErrorType.api, 'failed')));
        sut.add(ArticleLoadEvent());
      },expect: () =>  [
        isA<ArticleLoadingState>(),
        isA<ArticleErrorState>().having((errorState) => errorState.errorMessage,'error','failed')
      ]
    );
  });
}
