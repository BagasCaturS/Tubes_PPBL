// ////////////////// Code sebelum Database//////////////////////

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;

// class StandingsScreen extends StatefulWidget {
//   @override
//   _StandingsScreenState createState() => _StandingsScreenState();
// }

// class _StandingsScreenState extends State<StandingsScreen> {
//   List<dynamic> standings = [];

//   @override
//   void initState() {
//     super.initState();
//     loadStandingsData();
//   }

//   Future<void> loadStandingsData() async {
//     final response = await http.get(Uri.parse('https://s3-id-jkt-1.kilatstorage.id/d3si-telu/portalbola/standings.json'));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       setState(() {
//         standings = data['standings'];
//       });
//     } else {
//       throw Exception('Failed to fetch schedule');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Klasemen'),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/goat.jpg'), // Replace with the actual image path
//             fit: BoxFit.cover,
//           ),
//         ),
//         padding: EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             DataTable(
//               columnSpacing: 8.0,
//               columns: [
//                 DataColumn(label: Text('No',
//                 style: TextStyle(color: Colors.white,
//                 fontWeight: FontWeight.bold),)),
//                 DataColumn(label: Text('Tim',
//                 style: TextStyle(color: Colors.white,
//                 fontWeight: FontWeight.bold))),
//                 DataColumn(label: Text('P',
//                 style: TextStyle(color: Colors.white,
//                 fontWeight: FontWeight.bold))),
//                 DataColumn(label: Text('W',
//                 style: TextStyle(color: Colors.white,
//                 fontWeight: FontWeight.bold))),
//                 DataColumn(label: Text('D',
//                 style: TextStyle(color: Colors.white,
//                 fontWeight: FontWeight.bold))),
//                 DataColumn(label: Text('L',
//                 style: TextStyle(color: Colors.white,
//                 fontWeight: FontWeight.bold))),
//                 DataColumn(label: Text('PTS',
//                 style: TextStyle(color: Colors.white,
//                 fontWeight: FontWeight.bold))),
//               ],
//               rows: standings.map((team) {
//                 return DataRow(
//                   cells: [
//                     DataCell(Text('${team['position']}',
//                     style: TextStyle(color: Colors.white,
//                     fontWeight: FontWeight.bold))),
//                     DataCell(Text('${team['team']}',
//                     style: TextStyle(color: Colors.white,
//                     fontWeight: FontWeight.bold))),
//                     DataCell(Text('${team['played']}',
//                     style: TextStyle(color: Colors.white,
//                     fontWeight: FontWeight.bold))),
//                     DataCell(Text('${team['won']}',
//                     style: TextStyle(color: Colors.white,
//                     fontWeight: FontWeight.bold))),
//                     DataCell(Text('${team['drawn']}',
//                     style: TextStyle(color: Colors.white,
//                     fontWeight: FontWeight.bold))),
//                     DataCell(Text('${team['lost']}',
//                     style: TextStyle(color: Colors.white,
//                     fontWeight: FontWeight.bold))),
//                     DataCell(Text('${team['points']}',
//                     style: TextStyle(color: Colors.white,
//                     fontWeight: FontWeight.bold))),
//                   ],
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


///////////////////setelah database/////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portalbola/model/database_klasemen.dart';
import 'package:portalbola/model/model_klasemen.dart';

class KlasemenScreeen extends StatefulWidget {
  @override
  _KlasemenScreeenState createState() => _KlasemenScreeenState();
}

class _KlasemenScreeenState extends State<KlasemenScreeen> {
  late DatabaseHandler handler;
  late List<ModelKlasemen> listOfFee = [];

  @override
  void initState() {
    super.initState();

    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      listOfFee = await addClassement();
      setState(() {});
    });
  }

Future<List<ModelKlasemen>> addClassement() async {
  List<ModelKlasemen> classements = [];

  ModelKlasemen klasemen_satu = ModelKlasemen(
    tim: "Borussia Dortmund",
    P: "10",
    W: "7",
    D: "2",
    L: "1",
    pts: "23",
  );
  classements.add(klasemen_satu);

  ModelKlasemen klasemen_dua = ModelKlasemen(
    tim: "Manchester City",
    P: "23",
    W: "12",
    D: "3",
    L: "12",
    pts: "33",
  );
  classements.add(klasemen_dua);

  ModelKlasemen klasemen_tiga = ModelKlasemen(
    tim: "Manchester United",
    P: "22",
    W: "23",
    D: "12",
    L: "9",
    pts: "43",
  );
  classements.add(klasemen_tiga);

  ModelKlasemen klasemen_empat = ModelKlasemen(
    tim: "Persib",
    P: "23",
    W: "13",
    D: "19",
    L: "11",
    pts: "21",
  );
  classements.add(klasemen_empat);

  ModelKlasemen klasemen_lima = ModelKlasemen(
    tim: "Real Madrid",
    P: "20",
    W: "15",
    D: "3",
    L: "2",
    pts: "48",
  );
  classements.add(klasemen_lima);

  ModelKlasemen klasemen_enam = ModelKlasemen(
    tim: "FC Barcelona",
    P: "21",
    W: "14",
    D: "4",
    L: "3",
    pts: "46",
  );
  classements.add(klasemen_enam);

  ModelKlasemen klasemen_tujuh = ModelKlasemen(
    tim: "Bayern Munich",
    P: "18",
    W: "14",
    D: "2",
    L: "2",
    pts: "44",
  );
  classements.add(klasemen_tujuh);

  ModelKlasemen klasemen_delapan = ModelKlasemen(
    tim: "Liverpool",
    P: "20",
    W: "12",
    D: "5",
    L: "3",
    pts: "41",
  );
  classements.add(klasemen_delapan);

  ModelKlasemen klasemen_sembilan = ModelKlasemen(
    tim: "Juventus",
    P: "19",
    W: "12",
    D: "4",
    L: "3",
    pts: "40",
  );
  classements.add(klasemen_sembilan);

  ModelKlasemen klasemen_sepuluh = ModelKlasemen(
    tim: "Paris Saint-Germain",
    P: "20",
    W: "11",
    D: "5",
    L: "4",
    pts: "38",
  );
  classements.add(klasemen_sepuluh);

  return classements;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bursa Transfer'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/goat.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 5.0,
                columns: [
                  DataColumn(
                    label: Text(
                      'Tim',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'P',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'W',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'D',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'L',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'PTS',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                rows: listOfFee.map((team) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(
                          team.tim,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          team.P as String,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          team.W as String,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          team.D as String,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          team.L as String,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          team.pts as String,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
