import 'package:flutter/material.dart';
// import 'questions.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  void checkAnswers(bool answer) {
    if (questions.isFinished()) {
      setState(() {
        if (answer == questions.getCrtAns()) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        questions.nextQues();
      });
    } else {
      // int crtCount =0;
      int totalCount = scoreKeeper.length;
      int crtCount = scoreKeeper.where((i) => i.icon == Icons.check).length;
      Alert(
        context: context,
        title: 'END OF QUIZ',
        content: Column(
          children: [
            const SizedBox(
                height: 20.0), // this will add a vertical space of 20 pixels
            Text(
              ' You did score of : $crtCount out of $totalCount ',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        style: const AlertStyle(
          titleStyle: TextStyle(
            color: Colors.white, // this will change the title text color to red
          ),
          // descStyle: TextStyle(
          //   color: Colors.white, // this will change the desc text color to blue
          // ),
          isCloseButton: false,
          isOverlayTapDismiss: false,
          backgroundColor: Colors.black,
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              // debugPrint("Cool af Button pressed");
              setState(() {
                questions.reSet();
                scoreKeeper = [];
              });
              Navigator.pop(context);
            },
            color: Colors.teal[900],
            radius: BorderRadius.circular(20.0),
            child: const Text(
              "Reset Quiz",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ).show();
    }
  }
  // int quesNum = 0;

  // List<String> questions = [
  //   'Sun sets in west?',
  //   'London is capital of Austria?',
  //   '9-11 incident happened on September 11 1995?',
  //   'An apple per day really keeps doctor away for whole year?',
  // ];
  // List<bool> answerResult = [
  //   true,
  //   false,
  //   false,
  //   true,
  // ];

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

  QuesBrain questions = QuesBrain();

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
              questions.getQuesTxt(),
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
                checkAnswers(true);
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
                checkAnswers(false);
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
