import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled_test/main.dart';
import 'package:untitled_test/question_model.dart';
//import 'package:intl/intl.dart';  // Import intl package for localization

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questionlist = getQuestions();
  int questionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03367A),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              "quizapp".tr(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            _questionWidget(),
            _answerList(),
            _nextbutton(),
          ],
        ),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "question".tr()+ "${questionIndex + 1}/${questionlist.length.toString()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Color(0xFF008325),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionlist[questionIndex].questionText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionlist[questionIndex]
          .answerList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelect = answer == selectedAnswer;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText.tr()),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: isSelect ? Colors.amber : Colors.white,
          foregroundColor: isSelect ? Colors.black : Colors.black,
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
      ),
    );
  }

  _nextbutton() {
    bool islastquestion = false;
    if (questionIndex == questionlist.length - 1) {
      islastquestion = true;
    }
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(islastquestion ? "submit".tr() : "next".tr()),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Color(0xFF008325),
          foregroundColor:Colors.white ,
        ),
        onPressed: () {
          if (islastquestion) {
            showDialog(context: context, builder: (_)=> _showdialog());
          } else {
            setState(() {
              selectedAnswer = null;
              questionIndex++;
            });
          }
        },
      ),
    );
  }

  _showdialog(){
    bool passed = false;

    if(score>= questionlist.length*0.6){
      passed=true;
    }

    String title =passed?"pass".tr() : "fail".tr();
    return AlertDialog(
      title: Text( "score".tr() +"$score\n"+title,
        style: TextStyle(color: passed?Colors.green: Colors.redAccent),

      ),
      content: ElevatedButton( child:  Text("restart".tr() ),
        onPressed: (){
        Navigator.pop(context);
        setState(() {
          questionIndex=0;
          score=0;
          selectedAnswer=null;
        });

        },
      ),
    );
  }
}
