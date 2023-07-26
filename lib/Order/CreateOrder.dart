import 'package:flutter/material.dart';
import 'package:flutter_sample/Order/PizzaSelector.dart';
import 'package:flutter_sample/Dialogs//AlertBox.dart';
import 'package:flutter_sample/Order/ListOrder.dart';
void main()
{

}
class CreateOrder extends StatelessWidget{
  @override
  Widget build(BuildContext buildContext)
  {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(top: 20,left: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text('Place your Order here!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            ),
            SizedBox(height: 20,),

            Row(
              children: [
                Text('Select Pizza: ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            ),
            SizedBox(height: 20,),
            PizzaSelector(), //Pizza List
            SizedBox(height: 20,),
            ListOrder(),
            Row(
              children: [
                ElevatedButton(
                  child: Text('Confirm Order'),
                  style: ButtonStyle(alignment: Alignment.center),
                  onPressed: () {
                      _clickConfirmOrder(buildContext);
                  },
                ),
              ],
            )

]
      ),
    )
    );
  }

  _clickConfirmOrder(BuildContext buildContext){
    return showDialog(
        context: buildContext,
        builder: (BuildContext context){
          return AlertBox('Only One Step Away!','Your total bill is 300. Please click OK to proceed','OK','Cancel');
        },
        barrierDismissible: false
    );
  }


}