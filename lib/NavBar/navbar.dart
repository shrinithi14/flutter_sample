import 'package:flutter/material.dart';


void main(){
  runApp(
  Text("Welcome Shrinithi")
  );
}
class NavBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext buildContext){
            return AppBar(title: Text('Welcome!',style: Theme.of(buildContext).textTheme.titleLarge,),
              backgroundColor: Color(0xff4169E1),

            );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}