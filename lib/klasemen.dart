import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class StandingsScreen extends StatefulWidget {
  @override
  _StandingsScreenState createState() => _StandingsScreenState();
}

class _StandingsScreenState extends State<StandingsScreen> {
  List<dynamic> standings = [];

  @override
  void initState() {
    super.initState();
    loadStandingsData();
  }

  Future<void> loadStandingsData() async {
    final response = await http.get(Uri.parse('https://s3-id-jkt-1.kilatstorage.id/d3si-telu/portalbola/standings.json'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        standings = data['standings'];
      });
    } else {
      throw Exception('Failed to fetch schedule');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Klasemen'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/goat.jpg'), // Replace with the actual image path
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DataTable(
              columnSpacing: 8.0,
              columns: [
                DataColumn(label: Text('No',
                style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('Tim',
                style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold))),
                DataColumn(label: Text('P',
                style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold))),
                DataColumn(label: Text('W',
                style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold))),
                DataColumn(label: Text('D',
                style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold))),
                DataColumn(label: Text('L',
                style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold))),
                DataColumn(label: Text('PTS',
                style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold))),
              ],
              rows: standings.map((team) {
                return DataRow(
                  cells: [
                    DataCell(Text('${team['position']}',
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold))),
                    DataCell(Text('${team['team']}',
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold))),
                    DataCell(Text('${team['played']}',
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold))),
                    DataCell(Text('${team['won']}',
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold))),
                    DataCell(Text('${team['drawn']}',
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold))),
                    DataCell(Text('${team['lost']}',
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold))),
                    DataCell(Text('${team['points']}',
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold))),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
