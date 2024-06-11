class MySettings {
  //Put your port here
  static const String port = "3000";
  //Put Your host here
  static const String hostIp = "10.42.0.1";
  //Your base API url 
  static const String myurl = "http://$hostIp:$port/";

  static String getUrl() {
    return myurl;
  }
}
