// convert datetime to yyyymmdd
String convertDateTimeToString(DateTime dateTime) {
  String year = dateTime.year.toString();
  String month = dateTime.month.toString();
  if (dateTime.month < 10) {
    month = '0' + month;
  }

  String day = dateTime.day.toString();
  if (dateTime.day < 10) {
    day = '0' + day;
  }


  String yyyymmdd = year + month + day;

  return yyyymmdd;
}