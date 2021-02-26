import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:myapp/jp_brush_questions/model/Question.dart';
import 'package:myapp/jp_brush_questions/request/ApiResponse.dart';
import 'package:myapp/jp_brush_questions/request/HttpUtils.dart';

class QuestionsDao {
  /// 获取问题列表
  static Future<ApiResponse<List<Question>>> getQuestions(String level, int questionType) async {
    try {
      List response = await HttpUtils.post("/api/questions/list/$level/$questionType");
      print(response.runtimeType);
      var list = response.map((data) => Question.fromJson(data)).toList();

      return ApiResponse.completed(list);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
