class MySettings{
  static const  String port = "3000";
  static const String myurl = "http://50.50.50.164:$port/";

  static String getUrl(){
    return myurl;
  }
}