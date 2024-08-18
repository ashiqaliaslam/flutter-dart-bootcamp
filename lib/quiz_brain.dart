// ignore_for_file: avoid_print

import 'package:flutter_bootcamp/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('A Giraffe tounge color is black', true),
    Question('The Oxofod company supply books in Pakistan', true),
    Question('K-2 mountain is in North Africa', false),
    Question('The second highest mountain is in Pakitan', true),
    Question('The mount everest is in Pakistan', false),
    Question('Our national bird name is Chakor', true),
    Question('Pakistan shares the border with Rajhastan', true),
    Question('World\'s beautiful stadium is in America', false),
    Question(
        'Bangladesh is a country which faced cruelity like Palastine', false),
    Question(
        'England is a country who has no independence day and national day',
        true),
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was "Moon".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called "Backrub".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('true');
      return true;
    } else {
      print('false');
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
