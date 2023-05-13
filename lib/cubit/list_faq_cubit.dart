import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_apps/models/list_faq_model.dart';
import 'package:my_apps/services/faq_service.dart';

part 'list_faq_state.dart';

class ListFaqCubit extends Cubit<ListFaqState> {
  ListFaqCubit() : super(ListFaqInitial());

  Future<void> get() async {
    try {
      emit(ListFaqLoading());

      ListFaqModel? models = await FaqService.get();

      if (models?.code == 200) {
        emit(ListFaqSuccess(models!));
      }
    } catch (e) {
      emit(ListFaqFailed(e.toString()));
    }
  }
}
