import 'package:easy_localization/easy_localization.dart';
import 'package:untitled_test/main.dart';

class Question {
  final String questionText;
  final List<Answer> answerList;

  Question(this.questionText, this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];

  //1st question

  list.add(Question(
    "firstquestion".tr(),
      [
        Answer("berlin".tr(), false),
        Answer("madrid".tr(), false),
        Answer("paris".tr(), true),
        Answer("rome".tr(), false),
      ],
  ));

  //2nd question

  list.add(Question(
    "secondquestion".tr(),
    [
      Answer("venus", false),
      Answer("mars", true),
      Answer("jupiter", false),
      Answer("saturn", false),
    ],
  ));

  //3rd question

  list.add(Question(
    "thirdquestion".tr(),
    [
      Answer("charlesDickens".tr(), false),
      Answer("william Shakespeare".tr(), true),
      Answer("markTwain".tr(), false),
      Answer("janeAusten".tr(), false),
    ],
  ));

  //4th question

  list.add(Question(
    "fourthquestion".tr(),
    [
      Answer("H₂O".tr(), true),
      Answer("CO₂".tr(), false),
      Answer("O₂".tr(), false),
      Answer("NaCl".tr(), false),
    ],
  ));

  //5th question

  list.add(Question(
    "fifthquestion".tr(),
    [
      Answer("elephant".tr(), false),
      Answer("giraffe".tr(), false),
      Answer("hippopotamus".tr(), false),
      Answer("blueWhale".tr(), true),
    ],
  ));

  return list;
}
