import 'package:flutter/material.dart';
import 'package:play_group/kehadiran.dart';

class Home extends StatelessWidget {
  final List<Data> kehadiran;

  Home(this.kehadiran);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: kehadiran
          .map(
            (element) => Table(
                  border: TableBorder.all(width: 3, color: Colors.black),
                  children: [
                    TableRow(children: [
                      TableCell(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[new Text(element.tanggal)],
                      )),
                      TableCell(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[new Text(element.waktuMasuk)],
                      )),
                      TableCell(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[new Text(element.waktuKeluar)],
                      )),
                      TableCell(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[new Text(element.namaPenjemput)],
                      )),
                    ])
                  ],
                ),
          )
          .toList(),
    );
  }
}
