part of 'update_faq_cubit.dart';

abstract class UpdateFaqState extends Equatable {
  const UpdateFaqState();

  @override
  List<Object> get props => [];
}

class UpdateFaqInitial extends UpdateFaqState {}

class UpdateFaqLoading extends UpdateFaqState {}

class UpdateFaqSuccess extends UpdateFaqState {
  final CreateFaqModel model;

  const UpdateFaqSuccess(this.model);

  @override
  List<Object> get props => [model];
}

class UpdateFaqFailed extends UpdateFaqState {
  final String errorMessage;

  const UpdateFaqFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
