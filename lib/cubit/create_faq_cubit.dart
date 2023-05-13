import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_apps/models/create_faq_model.dart';
import 'package:my_apps/services/faq_service.dart';

part 'create_faq_state.dart';

class CreateFaqCubit extends Cubit<CreateFaqState> {
  CreateFaqCubit() : super(CreateFaqInitial());

  Future<void> create(
      {required String pertanyaan,
      required String jawaban,
      required bool statusPublish}) async {
    try {
      emit(CreateFaqLoading());

      CreateFaqModel model = await FaqService.create(
          pertanyaan: pertanyaan,
          jawaban: jawaban,
          statusPublish: statusPublish);

      if (model.code == 200) {
        emit(CreateFaqSuccess(model));
      }
    } catch (e) {
      emit(CreateFaqFailed('$e'));
    }
  }
}
