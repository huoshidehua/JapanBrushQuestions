import 'package:myapp/jp_brush_questions/model/Question.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "Question") {
      return Question.fromJson(json) as T;
    } else {
      return null;
    }
  }
}