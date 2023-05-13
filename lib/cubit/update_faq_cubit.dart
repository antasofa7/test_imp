import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_apps/models/create_faq_model.dart';

import '../services/faq_service.dart';

part 'update_faq_state.dart';

class UpdateFaqCubit extends Cubit<UpdateFaqState> {
  UpdateFaqCubit() : super(UpdateFaqInitial());

  Future<void> update(
      {required int id,
      required String pertanyaan,
      required String jawaban,
      required bool statusPublish}) async {
    try {
      emit(UpdateFaqLoading());

      CreateFaqModel model = await FaqService.update(
          id: id,
          pertanyaan: pertanyaan,
          jawaban: jawaban,
          statusPublish: statusPublish);

      if (model.code == 200) {
        emit(UpdateFaqSuccess(model));
      }
    } catch (e) {
      emit(UpdateFaqFailed('$e'));
    }
  }
}
