import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/jp_brush_questions/request/ApiResponse.dart';
import 'package:myapp/jp_brush_questions/widget/OptionsWidget.dart';

import 'package:myapp/jp_brush_questions/model/Option.dart';
import 'package:myapp/jp_brush_questions/model/Question.dart';

import 'dao/QuestionsDao.dart';

class QuestionPaper extends StatelessWidget {
  // 等级
  String level;

  // 模块 0:综合，1 文字词汇 2语法 3阅读 4听力
  int questionType;

  List<Question> questions = List.empty();

  QuestionPaper({@required this.level, @required this.questionType}) {
    loadQuestions() async{
      ApiResponse<List<Question>> response = await QuestionsDao.getQuestions(level, questionType);
      questions =  response.data;
    }
    loadQuestions();
    print(questions.length);
    // loadQuestions();
  }


  @override
  Widget build(BuildContext context) {
    var mainColor = const Color(0xFFF1EFE3);
    var textColor = CupertinoColors.black;
    var iconColor = CupertinoColors.black;

    /// 图标字体大小
    double iconSize = 28.0;

    /// 导航条 右侧图标按钮 paddinng
    var traingBtnsPadding = const EdgeInsets.only(left: 0, right: 0);

    return CupertinoPageScaffold(
      backgroundColor: mainColor,
      navigationBar: CupertinoNavigationBar(
        padding: const EdgeInsetsDirectional.only(start: 10.0, end: 2.0),

        /// 左侧关闭按钮
        leading: CupertinoButton(
          padding: traingBtnsPadding,
          color: mainColor,
          minSize: 20.0,
          child: Icon(CupertinoIcons.clear_thick_circled, size: iconSize, color: iconColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        middle: Text(
          level + questionType.toString(),
          style: TextStyle(color: textColor),
        ),
        backgroundColor: mainColor,
        border: Border(bottom: BorderSide.none),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// 右侧保存进度按钮
            CupertinoButton(
              padding: traingBtnsPadding,
              color: mainColor,
              child: Icon(Icons.save_rounded, size: iconSize + 4, color: iconColor),
              onPressed: () {},
            ),

            /// 右侧设置按钮 设置字体大小之类的
            CupertinoButton(
              padding: traingBtnsPadding,
              color: mainColor,
              child: Icon(CupertinoIcons.settings_solid, size: iconSize, color: iconColor),
              onPressed: () {},
            ),
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            /// 题目标号
            Container(
              height: 100,
              padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => Container(width: 16),
                itemBuilder: (context, index) {
                  return buildNumber(index: index, isSelected: false);
                },
                itemCount: 16,
              ),
            ),

            /// 题目
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) => {},
                controller: PageController(),
                itemCount: 16,
                itemBuilder: (context, index) {
                  // final question = category.questions[index];

                  return buildQuestion(
                    question: Question(
                      text: "aaaaaaa",
                      options: [
                        Option(text: "A OOPTION", code: "A", correct: true),
                        Option(text: "A OOPTION", code: "A", correct: false),
                        Option(text: "A OOPTION", code: "A", correct: false),
                        Option(text: "A OOPTION", code: "A", correct: false),
                        Option(text: "A OOPTION", code: "A", correct: false),
                        Option(text: "A OOPTION", code: "A", correct: false),
                        Option(text: "A OOPTION", code: "A", correct: false),
                        Option(text: "A OOPTION", code: "A", correct: false),
                        Option(text: "A OOPTION", code: "A", correct: false),
                        Option(text: "A OOPTION", code: "A", correct: false),
                      ],
                      solution: "i can't beleve",
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

///
Widget buildQuestion({
  @required Question question,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text(
          question.text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(height: 8),
        Text(
          'Choose your answer from below',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
        ),
        SizedBox(height: 32),
        Expanded(
          child: OptionsWidget(
            question: question,
            onClickedOption: (Option option) {
              if (question.locked) {
                return;
              } else {
                /*setState(() {
                  question.isLocked = true;
                  question.selectedOption = option;
                });*/
              }
            },
          ),
        ),
      ],
    ),
  );
}

Widget buildNumber({
  @required int index,
  @required bool isSelected,
}) {
  final color = isSelected ? Colors.orange.shade300 : Colors.white;

  return GestureDetector(
    onTap: () => {},
    child: CircleAvatar(
      radius: 30,
      backgroundColor: color,
      child: Text(
        '${index + 1}',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
  );
}
