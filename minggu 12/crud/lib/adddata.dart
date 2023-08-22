import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerTingktan = new TextEditingController();
  TextEditingController controllerTahunMasuk = new TextEditingController();
  TextEditingController controllerTahunKeluar = new TextEditingController();

  void addData() {
    var url = 'http://10.10.7.117:8080/api/api_pendidikan/';

    http.post(Uri.parse(url), body: {
      "nama": controllerNama.text,
      "tingkatan": controllerTingktan.text,
      "tahun_masuk": controllerTahunMasuk.text,
      "tahun_keluar": controllerTahunKeluar.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADD DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration:
                      new InputDecoration(hintText: "Nama", labelText: "Nama"),
                ),
                new TextField(
                  controller: controllerTingktan,
                  decoration: new InputDecoration(
                      hintText: "Tingkatan", labelText: "Tingkatan"),
                ),
                new TextField(
                  controller: controllerTahunMasuk,
                  decoration: new InputDecoration(
                      hintText: "TahunMasuk", labelText: "TahunMasuk"),
                ),
                new TextField(
                  controller: controllerTahunKeluar,
                  decoration: new InputDecoration(
                      hintText: "TahunKeluar", labelText: "TahunKeluar"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new ElevatedButton(
                  child: new Text("ADD DATA"),
                  onPressed: () {
                    addData();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Home()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
