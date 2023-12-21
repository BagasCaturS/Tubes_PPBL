import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<dynamic> matches = [];

  @override
  void initState() {
    super.initState();
    fetchSchedule();
  }

  Future<void> fetchSchedule() async {
    final response = await http.get(Uri.parse('https://raw.githubusercontent.com/openfootball/football.json/master/2015-16/en.1.json'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        matches = data['rounds'][0]['matches'];
      });
    } else {
      throw Exception('Failed to fetch schedule');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Pertandingan Liga Inggris'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/goat.jpg'), // Replace with the actual image path
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: matches.length,
          itemBuilder: (BuildContext context, int index) {
            final match = matches[index];
            return Card(
              elevation: 2,
              child: ListTile(
                title: Column(
                  children: [
                    Text('${match['team1']}'),
                    Text('VS'),
                    Text('${match['team2']}'),
                  ],
                ),
                subtitle: Text('${match['date']}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
