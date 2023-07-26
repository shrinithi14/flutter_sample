
import 'package:flutter/material.dart';
import 'package:flutter_sample/Dialogs/InfoBox.dart';
import 'package:flutter_sample/Dialogs/AlertBox.dart';
import 'package:flutter_sample/Utility/SharedPreferencesHelper.dart';
class Login extends StatefulWidget{
@override
LoginState createState() => LoginState();
}
class LoginState extends State<Login>{
  bool _rememberPassword = false;
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Map<String,String> credentials = {'shrini': '1234'};
  @override
  void initState(){
    super.initState();
    _loadSavedData();
  }

@override
  Widget build(BuildContext buildContext){
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
            child:  Image.asset('assets/store-logo.png',width: 100,height: 100,),
            ),
          ],
        ) ,
        SizedBox(height: 20,),
        Row(
          children: [
            Expanded(child:
        TextField(
              controller:   _userNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Email'),
                hintText: 'Enter a valid email (Eg: abc@test.com)',
                prefixIcon: const Icon(Icons.email_outlined)
              ),
            // onChanged :(String inputText){
            //   setState(() {
            //     _username = inputText;
            //   });
            // },
            ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Expanded(child:
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Password'),
                hintText: 'Enter your password',
                prefixIcon:const Icon(Icons.password_rounded)
              ),
                // onChanged :(String inputText){
                //   setState(() {
                //     _passwordController = inputText;
                //   });
                // },

            ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(child:  CheckboxListTile(
                value: _rememberPassword!,
                title: Text('Remember Me'),
                onChanged: (value){
                  setState(() {
                    _rememberPassword = value!;
                  });
                }
            ),
            ),
          ],
        ),
        Row(
          children: [
           Expanded(child: ElevatedButton(onPressed: (){
             bool loginSuccess = _checkLogin(_userNameController.text, _passwordController.text);
             print(loginSuccess);
             if(loginSuccess == true){
               _loginSuccessCallBack(buildContext);
             }
             else{
               _loginFailedCallBack(buildContext);
             }
           },
                child: Text('Login'))
           ),
          ],

        ),
        // Row(
        //   children: [
        //     Expanded(child: ElevatedButton(onPressed: (){
        //       bool loginSuccess = _checkLogin(_username, _password);
        //       print("$_username, $_password");
        //       print(loginSuccess);
        //       if(loginSuccess == true){
        //         _loginSuccessCallBack(buildContext);
        //       }
        //       else{
        //         _loginFailedCallBack(buildContext);
        //       }
        //     },
        //         child: Text('Register'))
        //     ),
        //   ],
        //
        // ),

      ],
    )
  );

}

bool _checkLogin(String username,String password){
    bool isRegisteredUser = credentials.containsKey(username.toLowerCase());
    if(isRegisteredUser == true){
       return credentials[username] == password;
    }
    else{
      return false;
    }
}
_loginSuccessCallBack(BuildContext buildContext) async{
  if(_rememberPassword == true){
    bool saved = await _saveUserName(_userNameController.text) && await _savePassword(_passwordController.text);
    if(saved){
      print("Data saved!");
      _loadSavedData();
    }
  }
  else{
    SharedPreferencesHelper helper  = SharedPreferencesHelper();
    helper.clearData();
    print("Data Cleared");
  }
  return showDialog(
      context: buildContext,
      builder: (BuildContext context){
        return InfoBox('Login successful','You''ve sucessfully logged in. Click OK to proceed',);
      },
      barrierDismissible: false
  );
}
_loginFailedCallBack(BuildContext buildContext){
  return showDialog(
      context: buildContext,
      builder: (BuildContext context){
        return AlertBox('Login Failed','Enter the correct username or password','OK','Cancel');
      },
      barrierDismissible: false
  );
}
_saveUserName(String username) async{
  SharedPreferencesHelper helper = new SharedPreferencesHelper();
  return await helper.saveData('username',username);
}
_savePassword(String password) async{
  SharedPreferencesHelper helper = new SharedPreferencesHelper();
  return await helper.saveData('password',password);
}
_fetchSavedData(String key) async{
  SharedPreferencesHelper helper = new SharedPreferencesHelper();
  var value = await helper.getData(key);
  return value;
}
_loadSavedData() async{
  var savedUsername = await _fetchSavedData('username');
  var savedPassword  = await _fetchSavedData('password');
  setState(() {
    _userNameController.text = savedUsername ?? '';
    _passwordController.text = savedPassword ?? '';
  });
  print("Saved Username is " + _userNameController.text + " and password is "+ _passwordController.text);

}
}