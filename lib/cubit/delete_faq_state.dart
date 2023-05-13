part of 'delete_faq_cubit.dart';

abstract class DeleteFaqState extends Equatable {
  const DeleteFaqState();

  @override
  List<Object> get props => [];
}

class DeleteFaqInitial extends DeleteFaqState {}

class DeleteFaqLoading extends DeleteFaqState {}

class DeleteFaqSuccess extends DeleteFaqState {
  final String message;

  const DeleteFaqSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class DeleteFaqFailed extends DeleteFaqState {
  final String errorMessage;

  const DeleteFaqFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
