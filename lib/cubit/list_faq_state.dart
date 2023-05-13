part of 'list_faq_cubit.dart';

abstract class ListFaqState extends Equatable {
  const ListFaqState();

  @override
  List<Object> get props => [];
}

class ListFaqInitial extends ListFaqState {}

class ListFaqLoading extends ListFaqState {}

class ListFaqSuccess extends ListFaqState {
  final ListFaqModel models;

  const ListFaqSuccess(this.models);

  @override
  List<Object> get props => [models];
}

class ListFaqFailed extends ListFaqState {
  final String errorMessage;

  const ListFaqFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
