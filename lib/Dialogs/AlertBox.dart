import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget{
  String _title = '';
  String _body = '';
  String _okButtonText = '';
  String _cancelButtonText = '';
  AlertBox(String title,String body,String OKButtonText,String CancelButtonText)
  {
    _title = title;
    _body = body;
    _okButtonText = OKButtonText;
    _cancelButtonText = CancelButtonText;
  }
  @override
  Widget build(BuildContext buildContext)
  {
    return AlertDialog(
     title: Text(_title),
      content: Text(_body),
      backgroundColor: Colors.redAccent,
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