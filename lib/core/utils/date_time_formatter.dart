import 'package:intl/intl.dart';

class DateTimeFormatter {
  //this will format the data ( Wednesday )
  static getDay(DateTime? dateTime) {
    DateFormat formatMDY = DateFormat('EEEE');
    return formatMDY.format(dateTime ?? DateTime.now());
  }

  //this will format the data ( 04 Jan, 2023)
  static formatDMy(DateTime? dateTime) {
    DateFormat dateFormatTypeMDYT = DateFormat('d MMM, yyyy');
    return dateFormatTypeMDYT.format(dateTime ?? DateTime.now());
  }

  //-------------------------------------01.03.2024.
  static String dateFormatDMY(DateTime? dateTime) {
    DateFormat formatYMD = DateFormat('dd.MM.yyyy.');
    return formatYMD
        .format(dateTime ?? DateTime.now());
  }
}
