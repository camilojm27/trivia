//https://codingwithjoe.com/dart-fundamentals-working-with-lists/
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Question {
  String text;
  List<String> answers;

  Question(this.text, this.answers);

  String get texto{
    return '$text $answers';
  }
}
final  SvgPicture background = SvgPicture.asset('assets/images/android_category_simple.svg');
int _questionIndex = 0;
int _numQuestion = min( (_questiions.length + 1)~/2, 3);
Question currentQuestion;
List<String> answers;

 List<Question> _questiions = [
   Question('What is Android Jetpack?', ['all of these', 'tools', 'documentation', 'libraries']),
   Question('Base class for Layout?', ['ViewGroup', 'ViewSet', 'ViewCollection', 'ViewRoot']),
    Question('Layout for complex Screens?',[
                    'ConstraintLayout', 'GridLayout', 'LinearLayout', 'FrameLayout']),
            Question('Pushing structured data into a Layout?',[
                    'Data Binding', 'Data Pushing', 'Set Text', 'OnClick']),
            Question('Inflate layout in fragments?',[
                    'onCreateView', 'onActivityCreated', 'onCreateLayout', 'onInflateLayout']),
            Question( 'Build system for Android?',[
                    'Gradle', 'Graddle', 'Grodle', 'Groyle']),
            Question('Android vector format?',[
                    'VectorDrawable', 'AndroidVectorDrawable', 'DrawableVector', 'AndroidVector']),
            Question('Android Navigation Component?',[
                    'NavController', 'NavCentral', 'NavMaster', 'NavSwitcher']),
            Question('Registers app with launcher?',[
                    'intent-filter', 'app-registry', 'launcher-registry', 'app-launcher']),
            Question('Mark a layout for Data Binding?', ['<layout>', '<binding>', '<data-binding>', '<dbinding>'])];
 
 void logr (){
   _questiions.forEach((n) => print(n.texto));
  
 }



class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);
  
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {


 _randomizeQuestions (){
   _questiions.shuffle();
   _questionIndex = 0;
   setQuestions();
   
    }
   
   void setQuestions() {
    currentQuestion = _questiions[_questionIndex];

    answers = currentQuestion.answers.toList();
    answers.shuffle();
    _questionIndex++;
    
}



  @override
  Widget build(BuildContext context) {
    _randomizeQuestions();
    return Scaffold(
      
      appBar: AppBar(title: Text('Android Trivia ($_questionIndex/$_numQuestion)'),),
          body: ListView(
              children: _questiions.map((index) => RadioListTile(
                title: Text(index.text),
                groupValue: _questionIndex,
                onChanged: (val){
                  
                },
              )).take(_numQuestion).toList(),
            
          ),
          
    );
  }
}