import 'game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() => runApp(Trivia());

class Trivia extends StatelessWidget {
  static const _titulo = 'Trivia';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _titulo,
      home: AndroidTriviaHome(title: _titulo,),
    );
  }
}

class AndroidTriviaHome extends StatelessWidget {
  AndroidTriviaHome({Key key, this.title}) : super(key:key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              SvgPicture.asset('assets/images/android_trivia.svg'),
              RaisedButton(
                onPressed: logr,
                child: Text('PLAY', style: TextStyle(color: Colors.purple),),
                color: Colors.grey.shade400,
              )
            ],
          ),
        ),
      ),
    );
  }
}