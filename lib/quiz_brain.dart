import 'questions.dart';

class QuesBrain {
  int _quesNum = 0;
  int _chkToIcons = 0;

  final List<Questions> _quesBank = [
    Questions(questionText: 'Sun sets in west?', answr: true),
    Questions(questionText: 'London is capital of Austria?', answr: false),
    Questions(
        questionText: '9-11 incident happened on September 11 1995?',
        answr: false),
    Questions(
        questionText:
            'An apple per day really keeps doctor away for whole year?',
        answr: true),
    Questions(questionText: 'The capital of India is Mumbai', answr: false),
    Questions(questionText: 'The Sun is a star', answr: true),
    Questions(questionText: 'Water boils at 100°C at sea level.', answr: true),
    Questions(
        questionText: 'The largest bone in the human body is the femur.',
        answr: true),
    Questions(questionText: 'The moon has no gravity', answr: false),
    Questions(questionText: 'A rhombus is a type of rectangle.', answr: false),
    Questions(
        questionText: 'Mercury is the hottest planet in the solar system',
        answr: false),
    Questions(
        questionText: 'The Nile is the longest river in the world',
        answr: true),
    Questions(questionText: 'Dogs can see Colors', answr: true),
    Questions(
        questionText:
            'Albert Einstein won the Nobel Prize for his theory of relativity',
        answr: true),
  ];

  String getQuesTxt() {
    return _quesBank[_quesNum].questionText;
  }

  bool getCrtAns() {
    return _quesBank[_quesNum].answr;
  }

  void nextQues() {
    if (_quesNum < _quesBank.length - 1) {
      _quesNum++;
    }
  }

  bool isFinished() {
    if (_chkToIcons < _quesBank.length) {
      _chkToIcons++;
      return true;
    } else {
      return false;
    }
  }

  void reSet() {
    _quesNum = 0;
    _chkToIcons = 0;
  }
}
