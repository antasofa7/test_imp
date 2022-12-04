import 'dart:convert';

import 'package:my_apps/models/articles_model.dart';
import 'package:http/http.dart' as http;
import 'package:my_apps/utils/constans.dart';

const String _endPoint = 'articles';
const _url = baseUrl + _endPoint;

class ArticlesService {
  Future<ArticlesModel?> fetchArticles() async {
    try {
      var response = await http.get(Uri.parse(_url), headers: {
        "Authorization": 'Bearer $token',
      });

      if (response.statusCode == 200) {
        return ArticlesModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
