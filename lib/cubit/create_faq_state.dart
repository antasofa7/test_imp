part of 'create_faq_cubit.dart';

abstract class CreateFaqState extends Equatable {
  const CreateFaqState();

  @override
  List<Object> get props => [];
}

class CreateFaqInitial extends CreateFaqState {}

class CreateFaqLoading extends CreateFaqState {}

class CreateFaqSuccess extends CreateFaqState {
  final CreateFaqModel model;

  const CreateFaqSuccess(this.model);

  @override
  List<Object> get props => [model];
}

class CreateFaqFailed extends CreateFaqState {
  final String errorMessage;

  const CreateFaqFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
