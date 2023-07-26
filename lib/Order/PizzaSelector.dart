import 'package:flutter/material.dart';

class PizzaSelector extends StatelessWidget{
  @override
  Widget build(BuildContext  buildContext){
    return Row(
      children: [
        Column(
          children: [
            Image.asset('assets/pizza-1.jpeg',height: 100)
          ],
        ),
        SizedBox(width: 20,),
        Column(
          children: [
            Image.asset('assets/pizza-2.jpeg',height: 100)
          ],
        ),
        SizedBox(width: 20,),
        Column(
          children: [
            Image.asset('assets/pizza-3.jpeg',height: 100)
          ],
        )
      ],
    );
  }
}