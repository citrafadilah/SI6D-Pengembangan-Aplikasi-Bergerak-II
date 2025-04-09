import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/time.dart';

class ApiService {
  static Future<TimeModel> fetchTime() async {
    final response = await http.get(
      Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=Europe/Amsterdam'),
    );

    if (response.statusCode == 200) {
      return TimeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load time data');
    }
  }
}
