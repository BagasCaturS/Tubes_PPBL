import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portalbola/model/database_transfer.dart';
import 'package:portalbola/model/model_transfer.dart';

class TransferScreen extends StatefulWidget {
  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  late DatabaseHandler handler;
  late List<ModelTransfer> listOfFee = [];

  @override
  void initState() {
    super.initState();

    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      listOfFee = await addFee();
      setState(() {});
    });
  }

  Future<List<ModelTransfer>> addFee() async {
    ModelTransfer firstFee = ModelTransfer(player: "Erling Haaland",from: "Borussia Dortmund",to: "Manchester City",transfer_fee: "£100,000,000");
    ModelTransfer secondFee = ModelTransfer(player: "Romelu Lukaku",from: "Chelsea",to: "As Roma",transfer_fee: "Loan");
    ModelTransfer thirdFee = ModelTransfer(player: "Jack Grealish",from: "Aston Villa",to: "Manchester City",transfer_fee: "£90,000,000");
    ModelTransfer fourthFee = ModelTransfer(player: "Jadon Sancho",from: "Borussia Dortmund",to: "Manchester United",transfer_fee: "£85,000,000");
    ModelTransfer fifthFee = ModelTransfer(player: "Raphael Varane",from: "Real Madrid",to: "Manchester United",transfer_fee: "£50,000,000");
    ModelTransfer sixFee = ModelTransfer(player: "Nicolas Pepe",from: "Arsenal",to: "Trabzonspor",transfer_fee: "Free");
    ModelTransfer sevenFee = ModelTransfer(player: "Philippe Coutinho",from: "Aston Villa",to: "Al-Duhail",transfer_fee: "Loan");
    ModelTransfer eightFee = ModelTransfer(player: "Georginio Wijnaldum",from: "PSG",to: "Al-Ettifaq",transfer_fee: "£8,000,000");
    ModelTransfer nineFee = ModelTransfer(player: "Matheus Nunes",from: "Wolves",to: "Manchester City",transfer_fee: "£62,000,000");
    ModelTransfer tenFee = ModelTransfer(player: "Benjamin Pavard",from: "Bayern Munich",to: "Inter Milan",transfer_fee: "£30,000,000");

    return [
      firstFee,
      secondFee,
      thirdFee,
      fourthFee,
      fifthFee,
      sixFee,
      sevenFee,
      eightFee,
      nineFee,
      tenFee,
    ];
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
                      'Pemain',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Klub Asal',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Klub Tujuan',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Harga Transfer',
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
                          team.player,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          team.from,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          team.to,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          team.transfer_fee,
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
