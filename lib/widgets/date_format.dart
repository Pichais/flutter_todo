String formatDate(String date) {
    DateTime inputDate = DateTime.parse(date);
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);

  if (inputDate == today) {
    return 'TODAY';
  } else if (inputDate == tomorrow) {
    return 'TOMORROW';
  } else {
    return '${inputDate.day} ${inputDate.monthName.toUpperCase()} ${inputDate.year}';
  }
}
extension DateTimeExtensions on DateTime {
  String get monthName {
    const monthNames = [
      "JAN", "FEB", "MAR", "APR", "MAY", "JUN",
      "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"
    ];
    return monthNames[month - 1];
  }
}