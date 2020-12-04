import 'package:bottom_navigation_bar_example/homepage.dart';
import 'package:flutter/material.dart';

import 'aramasayfasi.dart';
import 'gonderisayfasi.dart';

void main () {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int seciliMenu = 1;

  List<Widget> sayfalarim;
  AnaSayfa anasayfa;
  GonderiSayfasi gonderiSayfasi;
  AramaSayfasi aramaSayfasi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    anasayfa = AnaSayfa();
    gonderiSayfasi = GonderiSayfasi();
    aramaSayfasi = AramaSayfasi();

    sayfalarim = [anasayfa,gonderiSayfasi,aramaSayfasi];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Bar"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Ana Sayfa"),backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(icon: Icon(Icons.add),title: Text("Gönderi Ekle"),backgroundColor: Colors.grey),
          BottomNavigationBarItem(icon: Icon(Icons.search),title: Text("Ara"),backgroundColor: Colors.deepOrangeAccent),
        ],
        type: BottomNavigationBarType.shifting,
        fixedColor: Colors.indigoAccent,
        currentIndex: seciliMenu,
        onTap: (index) {
          setState(() {
            seciliMenu = index;
          });
        },
      ),
      body: sayfalarim[seciliMenu]
    );
  }
}
