import 'package:flutter/material.dart';
import 'package:second_app/answer_button.dart';
import 'package:second_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreens extends StatefulWidget {
  const QuestionsScreens({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreens> createState() {
    return _QuestionsScreensState();
  }
}

class _QuestionsScreensState extends State<QuestionsScreens> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentScreen = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentScreen.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 230, 213, 240),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentScreen.getShuffledAnswers().map(
              (item) {
                return AnswerButton(
                    answerText: item,
                    onTap: () {
                      answerQuestion(item);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
