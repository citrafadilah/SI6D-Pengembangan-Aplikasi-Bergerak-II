import 'package:flutter/material.dart';
import 'models/time.dart';
import 'services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time API Demo',
      theme: ThemeData.dark(),
      home: const TimeScreen(),
    );
  }
}

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  late Future<TimeModel> timeData;

  @override
  void initState() {
    super.initState();
    timeData = ApiService.fetchTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Time in Europe/Amsterdam")),
      body: Center(
        child: FutureBuilder<TimeModel>(
          future: timeData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              return Text(
                'Date: ${snapshot.data!.date}\n'
                'Time: ${snapshot.data!.time}\n'
                'Time Zone: ${snapshot.data!.timeZone}',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              );
            } else {
              return const Text("No data");
            }
          },
        ),
      ),
    );
  }
}
