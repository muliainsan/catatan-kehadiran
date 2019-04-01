import 'package:flutter/material.dart';
import './home.dart';
class HomeManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeManagerState();
  }
}

class _HomeManagerState extends State<HomeManager> {
  List<String> _kehadiran = ['Hadir'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: RaisedButton(
          onPressed: () {
            setState(() {
              _kehadiran.add('bbb');
            });
          },
          child: Text("pilih Bulan"),
        ),
      ),
      Table(
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
                )),
            TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[new Text("Penjemput")],
                )),
          ]),
        ],
      ),
      Home(_kehadiran)
    ]);
  }
}
