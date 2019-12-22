import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class GameWonFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Game Won!'),),
      body: Container(
          color: Colors.greenAccent[100],
          child: Column(
            children: <Widget>[
              Expanded(child: SvgPicture.asset('assets/images/you_win.svg')),
              RaisedButton(child: Text('NEXT MATCH'),onPressed: (){Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);})
            ],
          )),
    );
  }
}