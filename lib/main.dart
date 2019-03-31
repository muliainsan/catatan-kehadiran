import 'package:flutter/material.dart';
import 'package:http/http.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home;
  }
}

class _Home extends State<MyApp> {
  List<String> kehadiran = ['Hadir']


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('home'),
        ),
        body: Table(
          border: TableBorder.all(width: 3, color: Colors.black),
          children: [
            TableRow(children: [
              TableCell(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[new Text("Tanggal")],
              )),
              TableCell(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[new Text("Jam Masuk")],
              )),
              TableCell(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[new Text("Jam Keluar")],
              ))
            ]),
            TableRow(children: [
              TableCell(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[new Text("11-11-1111")],
              )),
              TableCell(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[new Text("00.00")],
              )),
              TableCell(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[new Text("00.00")],
              ))
            ])
          ],
        ),
      ),
    );
  }
}
