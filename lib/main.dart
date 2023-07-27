import 'package:flutter/material.dart';

void main() {
  runApp(const Quizler());
}

class Quizler extends StatelessWidget {
  const Quizler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          title: const Text('Quiz Time'),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
          centerTitle: true,
        ),
        body: const QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'Sun sets in west?',
    'London is capital of Austria?',
    '9-11 incident happened on September 11 1995?',
    'An apple per day really keeps doctor away for whole year?',
  ];
  int quesNum = 0;
  List<bool> answerResult = [
    true,
    false,
    false,
    true,
  ];
  // List<Widget> txt = [
  //   const Text(
  //     'This is where my Question will be displayed',
  //     textAlign: TextAlign.center,
  //     style: TextStyle(
  //       color: Colors.cyanAccent,
  //       fontWeight: FontWeight.bold,
  //       fontSize: 25.0,
  //     ),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              questions[quesNum],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.cyanAccent,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),

            // child: txt[0],
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: MaterialButton(
              onPressed: () {
                bool answerCheck = answerResult[quesNum];
                if (answerCheck == true) {
                  print('user got it right quesNUM : $quesNum');
                } else {
                  print('user got it wrong quesNUM : $quesNum');
                }
                setState(() {
                  scoreKeeper.add(
                    const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );

                  quesNum++;
                });
              },
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
        ),
        // const SizedBox(height: 10.0),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: MaterialButton(
              onPressed: () {
                bool answerCheck = answerResult[quesNum];

                if (answerCheck == false) {
                  print('user got it right quesNUM : $quesNum');
                } else {
                  print('user got it wrong quesNUM : $quesNum');
                }
                setState(() {
                  scoreKeeper.add(
                    const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                  quesNum++;
                });
              },
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
