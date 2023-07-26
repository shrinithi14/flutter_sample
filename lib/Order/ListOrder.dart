import 'package:flutter/material.dart';
import 'package:flutter_sample/Dialogs/InfoBox.dart';

class ListOrder extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    var listView = getListTiles();
    return listView;
  }
  List<String> getListItems(){
     List<String> pizzaList = ['Pizza - 1','Pizza - 2','Pizza - 3'];
     return pizzaList;
  }
  Widget getListTiles(){
    var listItems = getListItems();
    Widget listViewBuilder = ListView.builder(
        itemBuilder: (context,index){
      var currentValue = listItems[index];
         return ListTile(
           title: Text(currentValue),
           onTap: (){
              print(currentValue);
              _clickListViewItem(context, currentValue);
           },
         );
    },
      itemCount: listItems.length,);//Added to fix the outOfIndex exception
    return listViewBuilder;
  }
  _clickListViewItem(BuildContext buildContext,String value){
    return showDialog(
        context: buildContext,
        builder: (BuildContext context){
          return InfoBox('Selected Value', "You have selected $value!");
        },
        barrierDismissible: false
    );
  }
}