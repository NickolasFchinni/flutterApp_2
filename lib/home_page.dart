import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const startAlignment = Alignment.topLeft;
const finalAlignment = Alignment.bottomRight;

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/quiz-logo.png',
              width: 300, color: const Color.fromARGB(150, 255, 255, 255)),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Text(
              'Learn Flutter the fun way',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 240, 222, 255),
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: OutlinedButton.icon(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
              ),
              onPressed: () {
                startQuiz();
              },
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                'Start Quiz',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
