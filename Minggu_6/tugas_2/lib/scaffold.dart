import 'package:flutter/material.dart';

class Scaffoldpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.dashboard),
          title: Text("Belajar MaterialApp Scaffold"),
          actions: <Widget>[
            Icon(Icons.search),
            // Icon(Icons.find_in_page)
          ],
          actionsIconTheme: IconThemeData(color: Colors.yellow),
          backgroundColor: Colors.pinkAccent,
          bottom: PreferredSize(
              child: Container(
                color: Colors.orange,
                height: 4.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
          centerTitle: true,
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          child: Text('+'),
          onPressed: () {},
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.redAccent, shape: BoxShape.circle),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.pinkAccent, shape: BoxShape.circle),
            ),
            Row(
              //TAMBAHKAN CODE INI
              mainAxisAlignment: MainAxisAlignment.end,
              //TAMBAHKAN CODE INI

              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent, shape: BoxShape.circle),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.redAccent, shape: BoxShape.circle),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent, shape: BoxShape.circle),
                ),
              ],
            ),
            SizedBox(height: 450),
            Container(
              height: 35,
              width: 90,
              margin: EdgeInsets.only(left: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.pinkAccent),
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: Text('kembali'),
              ),
            ),
          ],
        ),

        //PERUBAHAN BARU
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
