import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> gambar = [
    "1.gif",
    "2.gif",
    "3.gif",
    "4.gif",
    "5.gif",
    "6.gif",
    "7.gif",
    "8.gif",
  ];
  static const Map<String, Color> colors = {
    '1': Color(0xFF2DB569),
    '2': Color(0xFF386B8),
    '3': Color(0xFF45CAF5),
    '4': Color(0xFFB19ECB),
    '5': Color(0xFFF58E4C),
    '6': Color(0xFF46C1BE),
    '7': Color(0xFFFFEA0E),
    '8': Color(0xFFDBE4E9),
  };

  @override
  Widget build(BuildContext context) {
    //timeDilation = 5.0;
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
              Colors.white,
              Colors.purpleAccent,
              Colors.deepPurple
            ])),
        child: new PageView.builder(
            controller: new PageController(viewportFraction: 0.4),
            itemCount: gambar.length,
            itemBuilder: (BuildContext contex, int i) {
              return new Padding(
                  padding:
                      new EdgeInsets.symmetric(horizontal: 3.0, vertical: 20.0),
                  child: new Material(
                    elevation: 8.0,
                    child: new Stack(fit: StackFit.expand, children: <Widget>[
                      new Hero(
                          tag: gambar[i],
                          child: new Material(
                            child: new InkWell(
                              child: new Flexible(
                                flex: 1,
                                child: Container(
                                  color: colors.values.elementAt(i),
                                  child: new Image.asset(
                                    "img/${gambar[i]}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: () => Navigator.of(context).push(
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new Halamandua(
                                            gambar: gambar[i],
                                            colors: colors.values.elementAt(i),
                                          ))),
                            ),
                          ))
                    ]),
                  ));
            }),
      ),
    );
  }
}

class Halamandua extends StatefulWidget {
  Halamandua({required this.gambar, required this.colors});
  final String gambar;
  final Color colors;

  @override
  _HalamanduaState createState() => _HalamanduaState();
}

class _HalamanduaState extends State<Halamandua> {
  Color warna = Colors.grey;

  void _pilihannya(Pilihan pilihan) {
    setState(() {
      warna = pilihan.warna;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Minions"),
        backgroundColor: Colors.purpleAccent,
        actions: <Widget>[
          new PopupMenuButton<Pilihan>(
            onSelected: _pilihannya,
            itemBuilder: (BuildContext context) {
              return listPilihan.map((Pilihan x) {
                return new PopupMenuItem<Pilihan>(
                  child: new Text(x.text),
                  value: x,
                );
              }).toList();
            },
          )
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
                gradient: new RadialGradient(
                    center: Alignment.center,
                    colors: [Colors.purple, warna, Colors.deepPurple])),
          ),
          new Center(
            child: new Hero(
                tag: widget.gambar,
                child: new ClipOval(
                    child: new SizedBox(
                        width: 300.0,
                        height: 300.0,
                        child: new Material(
                          child: new InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: new Flexible(
                              flex: 1,
                              child: Container(
                                color: widget.colors,
                                child: new Image.asset(
                                  "img/${widget.gambar}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )))),
          )
        ],
      ),
    );
  }
}

class Pilihan {
  const Pilihan({required this.text, required this.warna});
  final String text;
  final Color warna;
}

List<Pilihan> listPilihan = const <Pilihan>[
  const Pilihan(text: "Red", warna: Colors.red),
  const Pilihan(text: "Green", warna: Colors.green),
  const Pilihan(text: "Blue", warna: Colors.blue),
];
