import 'package:shared_preferences/shared_preferences.dart';

class  SharedPreferencesHelper{

  Future<bool> saveData(String key, String value) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(key, value);
  }

  getData(String key) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return  preferences.getString(key);
  }
  clearData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}