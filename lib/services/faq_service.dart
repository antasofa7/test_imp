import 'package:dio/dio.dart';
import 'package:my_apps/helper/dio_exception.dart';
import 'package:my_apps/helper/dio_helper.dart';
import 'package:my_apps/models/create_faq_model.dart';
import 'package:my_apps/models/delete_faq_model.dart';
import 'package:my_apps/models/faq_detail_model.dart';
import 'package:my_apps/models/list_faq_model.dart';

class FaqService {
  static Future<dynamic> get() async {
    try {
      var params = {"page": 1, "row": 10};

      final Response response =
          await DioHelper.get('superadmin/faq', queryParameters: params);
      if (response.statusCode == 200) {
        var models = ListFaqModel.fromJson(response.data);
        return models;
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  static Future<dynamic> create(
      {required String pertanyaan,
      required String jawaban,
      required bool statusPublish}) async {
    try {
      var data = {
        "pertanyaan": pertanyaan,
        "jawaban": jawaban,
        "status_publish": statusPublish
      };

      final Response response =
          await DioHelper.post('superadmin/faq', data: data);

      if (response.statusCode == 200) {
        var models = CreateFaqModel.fromJson(response.data);
        return models;
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  static Future<dynamic> getDetail({required int id}) async {
    try {
      final Response response = await DioHelper.get('superadmin/faq/$id');
      if (response.statusCode == 200) {
        var models = FaqDetailModel.fromJson(response.data);
        return models;
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  static Future<dynamic> update(
      {required int id,
      required String pertanyaan,
      required String jawaban,
      required bool statusPublish}) async {
    try {
      var data = {
        "pertanyaan": pertanyaan,
        "jawaban": jawaban,
        "status_publish": statusPublish
      };

      final Response response =
          await DioHelper.post('superadmin/faq/$id', data: data);

      if (response.statusCode == 200) {
        var models = CreateFaqModel.fromJson(response.data);
        return models;
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  static Future<dynamic> delete({required int id}) async {
    try {
      final Response response = await DioHelper.delete('superadmin/faq/$id');
      if (response.statusCode == 200) {
        var model = DeleteFaqModel.fromJson(response.data);
        return model;
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
