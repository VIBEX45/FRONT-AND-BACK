class MySettings {
  static const String port = "3000";
  static const String hostIp = "10.21.6.143";
  static const String myurl = "http://$hostIp:$port/";

  static String getUrl() {
    return myurl;
  }
}
