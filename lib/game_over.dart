import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class GameOverFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Game Over!'),),
      body: Container(
        color: Colors.redAccent[100],
          child: Column(
            children: <Widget>[
              Expanded(child: SvgPicture.asset('assets/images/try_again.svg')),
              RaisedButton(child: Text('TRY AGAIN'),onPressed: (){Navigator.popAndPushNamed(context, '/');})
            ],
          )),
    );
  }
}
