import 'package:intl/intl.dart';

class DateTimeFormatter {
  //this will format the data ( Wednesday, Jan 4, 2023 )
  static formatDMY(String? dateTime) {
    DateFormat formatMDY = DateFormat('EEEE, MMM d, yyyy');
    return formatMDY
        .format(DateTime.parse(dateTime ?? DateTime.now().toString()));
  }

  //this will format the data ( 04 Jan, 2023 06:30 AM )
  static formatDMYT(String? dateTime) {
    DateFormat dateFormatTypeMDYT = DateFormat('d MMM, yyyy hh:mm a');
    return dateFormatTypeMDYT
        .format(DateTime.parse(dateTime ?? DateTime.now().toString()));
  }

  //this will format the data ( 04 Jan, 2023)
  static formatDMy(String? dateTime) {
    DateFormat dateFormatTypeMDYT = DateFormat('d MMM, yyyy');
    return dateFormatTypeMDYT
        .format(DateTime.parse(dateTime ?? DateTime.now().toString()));
  }

  static fomatMDD(String? dateTime) {
    DateFormat dateFormatTypeMDYT = DateFormat('MMM d EEEE');
    return dateFormatTypeMDYT
        .format(DateTime.parse(dateTime ?? DateTime.now().toString()));
  }

  //this will format the data ( Jan 04 )
  static formatDM(String? dateTime) {
    DateFormat dateFormatTypeMDYT = DateFormat('MMMd');
    return dateFormatTypeMDYT
        .format(DateTime.parse(dateTime ?? DateTime.now().toString()));
  }

  //-------------------------------------2020-10-25
  static String dateFormatYMD(String? dateTime) {
    DateFormat formatYMD = DateFormat('yyyy-MM-dd');
    return formatYMD
        .format(DateTime.parse(dateTime ?? DateTime.now().toString()));
  }
  //-------------------------------------2020-10-25
  static String dateFormatYMDS(DateTime? dateTime) {
    DateFormat formatYMD = DateFormat('yyyy/MM/dd');
    return formatYMD
        .format(dateTime ?? DateTime.now());
  }

  //this will format the data ( June 04, 2023)
  static formatMDy(DateTime? dateTime) {
    DateFormat dateFormatTypeMDYT = DateFormat('MMM d, yyyy');
    return dateFormatTypeMDYT
        .format(dateTime ?? DateTime.now());
  }

  //this will format the data (  06:30 AM )
  static onlyTime(String? dateTime) {
    DateFormat dateFormatTypeMDYT = DateFormat('hh:mm a');
    return dateFormatTypeMDYT
        .format(DateTime.parse(dateTime ?? DateTime.now().toString()));
  }


}