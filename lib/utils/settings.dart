class MySettings {
  static const String port = "3000";
  static const String hostIp = "50.50.50.164";
  static const String myurl = "http://$hostIp:$port/";

  static String getUrl() {
    return myurl;
  }
}
