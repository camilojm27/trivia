//https://codingwithjoe.com/dart-fundamentals-working-with-lists/
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Question {
  String text;
  List<String> answers;

  Question(this.text, this.answers);

}

final SvgPicture background =
    SvgPicture.asset('assets/images/android_category_simple.svg');
int _questionIndex = 0;
int _numQuestion = min((_questiions.length + 1) ~/ 2, 3);
Question currentQuestion;
List<String> answers;

List<Question> _questiions = [
  Question('What is Android Jetpack?', ['all of these', 'tools', 'documentation', 'libraries']),
  Question('Base class for Layout?', ['ViewGroup', 'ViewSet', 'ViewCollection', 'ViewRoot']),
  Question('Layout for complex Screens?',['ConstraintLayout', 'GridLayout', 'LinearLayout', 'FrameLayout']),
  Question('Pushing structured data into a Layout?',['Data Binding', 'Data Pushing', 'Set Text', 'OnClick']),
  Question('Inflate layout in fragments?',['onCreateView', 'onActivityCreated', 'onCreateLayout', 'onInflateLayout']),
  Question( 'Build system for Android?',['Gradle', 'Graddle', 'Grodle', 'Groyle']),
  Question('Android vector format?',['VectorDrawable', 'AndroidVectorDrawable', 'DrawableVector', 'AndroidVector']),
  Question('Android Navigation Component?',['NavController', 'NavCentral', 'NavMaster', 'NavSwitcher']),
  Question('Registers app with launcher?',['intent-filter', 'app-registry', 'launcher-registry', 'app-launcher']),
  Question('Mark a layout for Data Binding?', ['<layout>', '<binding>', '<data-binding>', '<dbinding>'])];

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  _randomizeQuestions() {
    _questiions.shuffle();
    _questionIndex = 0;
    setQuestions();
  }

  void setQuestions() {
    _questionIndex++;
    currentQuestion = _questiions[_questionIndex - 1];

    answers = currentQuestion.answers.toList();
    answers.shuffle();
  }
 static String _groupValueRadioButtons;


  List<Widget> makeRadios(){
    List<Widget> list = new List<Widget> ();
    for(int i=0; i <= 3; i++){

    list.add(RadioListTile(title: Text(answers[i]), value: answers[i], groupValue: _groupValueRadioButtons,
        onChanged: (value){setState(() {
          _groupValueRadioButtons = value;
        });} ));
    }
    return list;
  }



  @override
  Widget build(BuildContext context) {
    if(_questionIndex == 0){

    _randomizeQuestions();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Android Trivia ($_questionIndex/$_numQuestion)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: background),
            Text(
              currentQuestion.text,
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: ListView(
                children: makeRadios(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RaisedButton(
                child: Text('SUBMIT'),
                onPressed: () {
                  //_questiions[_questionIndex-1].answers.forEach((f) => print(f.toString()));
                  print('Correcta ' + _questiions[_questionIndex - 1].answers[0] + ' pos ' + _questionIndex.toString());
                  //Next round or win
                  if(_groupValueRadioButtons == _questiions[_questionIndex - 1].answers[0]){
                      print('Next round or win');
                      if(_questionIndex < _numQuestion){
                        setState(() {

                        setQuestions();
                        });
                      }
                      else{
                        Navigator.pushNamed(context, '/game/won');
                      }

                  }
                  else{
                    Navigator.pushNamed(context, '/game/over');
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
