class TimeModel {
  final String date;
  final String time;
  final String timeZone;

  TimeModel({required this.date, required this.time, required this.timeZone});

  factory TimeModel.fromJson(Map<String, dynamic> json) {
    return TimeModel(
      date: json['date'],
      time: json['time'],
      timeZone: json['timeZone'],
    );
  }
}
