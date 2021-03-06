import 'package:finq/di/injectable.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/journeys/articles/article_card_item.dart';
import 'package:finq/presentation/journeys/articles/widget_items/article_error_dialog.dart';
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
        body: BlocProvider.value(
      value: articleBloc,
      child: BlocConsumer<ArticleBloc, ArticleState>(
        listenWhen: (previous, current) => current is ArticleErrorState,
        listener: (context, state) async {
          debugPrint('${state.toString()}');
          if (state is ArticleErrorState) {
            showDialog(
                context: context,
                builder: (context) {
                  return ArticleErrorDialog((state).errorMessage, () {
                    Navigator.pop(context);
                    articleBloc.add(ArticleLoadEvent());
                  });
                });
          }
        },
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
          if (state is ArticleLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SizedBox.shrink();
        },
      ),
    ));
  }
}
