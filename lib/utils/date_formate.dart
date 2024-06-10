import 'package:intl/intl.dart';

class FormatDate{
  static formateDateFromDateString(String stringDate, String format){
    return DateFormat(format).format(DateTime.parse(stringDate));
  }
}