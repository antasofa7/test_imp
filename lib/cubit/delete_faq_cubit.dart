import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_apps/models/delete_faq_model.dart';

import '../services/faq_service.dart';

part 'delete_faq_state.dart';

class DeleteFaqCubit extends Cubit<DeleteFaqState> {
  DeleteFaqCubit() : super(DeleteFaqInitial());

  Future<void> delete({required int id}) async {
    try {
      emit(DeleteFaqLoading());

      DeleteFaqModel model = await FaqService.delete(id: id);

      if (model.code == 200) {
        emit(DeleteFaqSuccess(model.message ?? ''));
      }
    } catch (e) {
      emit(DeleteFaqFailed('$e'));
    }
  }
}
