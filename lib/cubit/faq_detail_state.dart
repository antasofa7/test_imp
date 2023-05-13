part of 'faq_detail_cubit.dart';

abstract class FaqDetailState extends Equatable {
  const FaqDetailState();

  @override
  List<Object> get props => [];
}

class FaqDetailInitial extends FaqDetailState {}

class FaqDetailLoading extends FaqDetailState {}

class FaqDetailSuccess extends FaqDetailState {
  final FaqDetailModel model;

  const FaqDetailSuccess(this.model);

  @override
  List<Object> get props => [model];
}

class FaqDetailFailed extends FaqDetailState {
  final String errorMessage;

  const FaqDetailFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
