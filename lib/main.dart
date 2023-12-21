import 'package:flutter/material.dart';
import 'package:portalbola/berita.dart';
import 'package:portalbola/jadwal_pertandingan.dart';
import 'package:portalbola/hasil_pertandingan.dart';
import 'package:portalbola/klasemen.dart';
import 'package:portalbola/jadwal_pertandingan2.dart';
import 'package:portalbola/transfer.dart';
import 'package:portalbola/scorer_inggris.dart';
import 'package:portalbola/scorer_spain.dart';
import 'package:portalbola/assist_inggris.dart';
import 'package:portalbola/assist_spain.dart';

void main() => runApp(
      MaterialApp(
        title: 'Portal Sepak Bola',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portal Sepak Bola'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/goat.jpg'), // Ganti dengan path gambar yang sesuai
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsScreen()),
                  );
                },
                child: Text('Berita Bola'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showLeagueDialog(context);
                },
                child: Text('Jadwal Pertandingan'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showSnackbar(context, 'Anda memasuki halaman Skor Pertandingan');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScoreScreen()),
                  );
                },
                child: Text('Skor Pertandingan'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showSnackbar(context, 'Anda memasuki halaman Klasemen');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KlasemenScreeen()),
                  );
                },
                child: Text('Klasemen'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showScoreDialog(context);
                },
                child: Text('Top Skor'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showAssistDialog(context);
                },
                child: Text('Top Assist'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showSnackbar(context, 'Anda memasuki halaman Bursa Transfer');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransferScreen()),
                  );
                },
                child: Text('Bursa Transfer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  
  void showLeagueDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Pilih Liga'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScheduleScreen()),
                );
                showSnackbar(context, 'Anda memasuki halaman Jadwal Pertandingan Liga Inggris');
              },
              child: Text('Liga Inggris'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScheduleScreen2()),
                );
                showSnackbar(context, 'Anda memasuki halaman Jadwal Pertandingan Liga Spanyol');
              },
              child: Text('Liga Spanyol'),
            ),
          ],
        );
      },
    );
  }

  void showScoreDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Pilih Liga'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScorerInggrisScreen()),
                );
                showSnackbar(context, 'Anda memasuki halaman Top Skor Liga Inggris');
              },
              child: Text('Liga Inggris'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScorerSpainScreen()),
                );
                showSnackbar(context, 'Anda memasuki halaman Top Skor Liga Spanyol');
              },
              child: Text('Liga Spanyol'),
            ),
          ],
        );
      },
    );
  }

  void showAssistDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Pilih Liga'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AssistInggrisScreen()),
                );
                showSnackbar(context, 'Anda memasuki halaman Top Assist Liga Inggris');
              },
              child: Text('Liga Inggris'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AssistSpainScreen()),
                );
                showSnackbar(context, 'Anda memasuki halaman Top Assist Liga Spanyol');
              },
              child: Text('Liga Spanyol'),
            ),
          ],
        );
      },
    );
  }
}
