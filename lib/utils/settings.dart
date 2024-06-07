class MySettings {
  static const String port = "3000";
  static const String hostIp = "10.107.43.29";
  static const String myurl = "http://$hostIp:$port/";

  static String getUrl() {
    return myurl;
  }
}
