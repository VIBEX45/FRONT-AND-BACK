import 'package:shared_preferences/shared_preferences.dart';


class MySharedPreferences{

  static void saveToSharedList(String key, List<String> value) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setStringList(key, value);
  }

  static Future<List<String>?> fetchFromShared(String key) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    List<String>? valueList = sp.getStringList(key);
    return valueList;
  }



}