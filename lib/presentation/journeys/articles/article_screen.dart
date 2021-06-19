import 'package:finq/di/get_it.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/journeys/articles/article_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  late ArticleBloc articleBloc;

  @override
  void initState() {
    super.initState();
    articleBloc = getItInstance<ArticleBloc>();
    articleBloc.add(ArticleLoadEvent());
  }

  @override
  void dispose() {
    articleBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocProvider.value(
          value: articleBloc,
          child: BlocBuilder<ArticleBloc, ArticleState>(
            builder: (context, state) {
              if (state is ArticleLoadedState) {
                return ListView.builder(
                  itemBuilder: (context, index) =>
                      ArticleCardItem(article: state.articles[index]),
                  shrinkWrap: true,
                  itemCount: state.articles.length,
                  scrollDirection: Axis.vertical,
                );
              }
              if (state is ArticleErrorState) {
                return SizedBox.shrink();
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
}
