
import 'package:flutter/material.dart';
import 'package:flutter_sample/NavBar/navbar.dart';
import 'package:flutter_sample/Order/CreateOrder.dart';
import 'package:flutter_sample/Order/ListOrder.dart';
import 'package:flutter_sample/Login/Login.dart';

void main(){
  runApp(
    Home()
  );
}
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext buildContext){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primaryColor: Colors.blue,
        fontFamily: 'Georgia',
        textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)
        )
      ),
      home: Scaffold(
        appBar:  NavBar(),
        body:Container(
          child: Login(),
        )
      ),
    );
  }
  getHomeContent(){
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue,Colors.indigoAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft
          )
      ),
      child: Center(
        child: Text("Home page",
          style: TextStyle(fontSize: 40,color: Colors.redAccent),),
      ),
    );
  }
}