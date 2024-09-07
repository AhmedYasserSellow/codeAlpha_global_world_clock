class TimeZoneCardModel {
  final String date, time, timeZone, dayName;
  final int hour;
  const TimeZoneCardModel({
    required this.date,
    required this.time,
    required this.timeZone,
    required this.dayName,
    required this.hour,
  });

  factory TimeZoneCardModel.fromJson(Map<String, dynamic> json) {
    return TimeZoneCardModel(
      date: json['date'],
      time: json['time'],
      timeZone: json['timeZone'],
      dayName: json['dayOfWeek'],
      hour: json['hour'],
    );
  }
}
