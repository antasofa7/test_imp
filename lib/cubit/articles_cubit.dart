import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_apps/models/articles_model.dart';
import 'package:my_apps/services/articles_service.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit() : super(ArticlesInitial());

  void fetchArticles() async {
    try {
      emit(ArticlesLoading());

      ArticlesModel? articles = await ArticlesService().fetchArticles();
      emit(ArticlesSuccess(articles!));
    } catch (e) {
      emit(ArticlesFailed(e.toString()));
    }
  }
}
