import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/sayfa2': (context) => Sayfa2(),
        '/sayfa3': (context) => Sayfa3(),
      },
      title: "Hes Uygulamasi",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hes Kodu Sorgulama  "),
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      body: Anaekran(),
    );
  }
}

class Anaekran extends StatefulWidget {
  const Anaekran({Key? key}) : super(key: key);

  @override
  _AnaekranState createState() => _AnaekranState();
}

class _AnaekranState extends State<Anaekran> {
  TextEditingController t1 = TextEditingController();
  List mesajlistesi = [];

  mesajekle(String metin) {
    setState(() {
      mesajlistesi.insert(0, metin);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Text("Hes Kodu   "),
              Flexible(
                child: TextField(
                  onSubmitted: mesajekle,
                  controller: t1,
                ),
              ),
              RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/sayfa2'),
                child: Text("Sorgula"),
              ),
            ])
          ],
        ));
  }
}

class Sayfa2 extends StatelessWidget {
  Widget build(BuildContext context) {
    var row = Row(children: <Widget>[
      Text("Ahm** Ber** Ço***"),
      RaisedButton(
        child: Text(
          "Geri dön!",
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      RaisedButton(
        child: Text("Fotoğraf Ekle", style: TextStyle(fontSize: 20)),
        onPressed: () => Navigator.pushNamed(context, '/sayfa3'),
      )
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sorgulama Ekranı'),
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      body: Center(
        child: row,
      ),
    );
  }
}

class Sayfa3 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fotoğraf Ekleme'),
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.camera_alt,
              size: 100,
            ),
          ],
        ),
      ),
    );
  }
}
