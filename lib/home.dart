import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<String> kehadiran;

  Home(this.kehadiran);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: kehadiran
          .map(
            (element) =>
            Table(
              border:
              TableBorder.all(width: 3, color: Colors.black),
              children: [
                TableRow(children: [
                  TableCell(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: <Widget>[new Text("11-11-1111")],
                      )),
                  TableCell(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: <Widget>[new Text("00.00")],
                      )),
                  TableCell(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: <Widget>[new Text("00.00")],
                      )),
                  TableCell(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: <Widget>[new Text("Jam Keluar")],
                      )),
                ])
              ],
            ),
      )
          .toList(),
    );
  }

}