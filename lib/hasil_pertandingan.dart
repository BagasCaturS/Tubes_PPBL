import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScoreScreen extends StatefulWidget {
  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  List<dynamic> matches = [];

  @override
  void initState() {
    super.initState();
    fetchScore();
  }

  Future<void> fetchScore() async {
    final response = await http.get(Uri.parse('https://raw.githubusercontent.com/openfootball/football.json/master/2015-16/en.1.json'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        matches = data['rounds'][0]['matches'];
      });
    } else {
      throw Exception('Failed to fetch score');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skor Pertandingan'),
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
            final team1 = match['team1'];
            final team2 = match['team2'];
            final score1 = match['score']['ft'][0];
            final score2 = match['score']['ft'][1];
            // final scoreText = '$team1 $score1 - $score2 $team2';

            return Card(
              elevation: 2,
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(team1, textAlign: TextAlign.center)),
                    Text('$score1 - $score2', textAlign: TextAlign.center),
                    Expanded(child: Text(team2, textAlign: TextAlign.center)),
                  ],
                ),
                subtitle: Center(child: Text('${match['date']}')),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              ),
            );
          },
        ),
      ),
    );
  }
}
