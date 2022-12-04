part of 'articles_cubit.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

class ArticlesInitial extends ArticlesState {}

class ArticlesLoading extends ArticlesState {}

class ArticlesSuccess extends ArticlesState {
  final ArticlesModel articles;

  const ArticlesSuccess(this.articles);

  @override
  List<Object> get props => [articles];
}

class ArticlesFailed extends ArticlesState {
  final String errorMessage;

  const ArticlesFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
