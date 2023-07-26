import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget{
  String _title = '';
  String _body = '';
  final _okButtonText = 'OK';
  final _cancelButtonText = 'Close';

  InfoBox(String title,String body)
  {
    _title = title;
    _body = body;
  }
  @override
  Widget build(BuildContext buildContext)
  {
    return AlertDialog(
      title: Text(_title),
      content: Text(_body),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text(_okButtonText),
          onPressed: () {
            Navigator.of(buildContext).pop();
          },
        ),
        new ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.redAccent
            ),
            onPressed: (){
              Navigator.of(buildContext).pop();
            },
            child: new Text(_cancelButtonText))
      ],
    );
  }
}