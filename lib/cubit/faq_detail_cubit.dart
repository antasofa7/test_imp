import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_apps/models/faq_detail_model.dart';
import 'package:my_apps/services/faq_service.dart';

part 'faq_detail_state.dart';

class FaqDetailCubit extends Cubit<FaqDetailState> {
  FaqDetailCubit() : super(FaqDetailInitial());

  Future<void> get({required int id}) async {
    try {
      emit(FaqDetailLoading());

      FaqDetailModel model = await FaqService.getDetail(id: id);

      if (model.code == 200) {
        emit(FaqDetailSuccess(model));
      }
    } catch (e) {
      emit(FaqDetailFailed('$e'));
    }
  }
}
