import 'package:flutter/material.dart';
import './home.dart';
import './home_control.dart';
import './kehadiran.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomeManager extends StatefulWidget {
  final List<Data> startingHome;
  HomeManager(this.startingHome);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeManagerState();
  }
}

class _HomeManagerState extends State<HomeManager> {
  List<Data> _kehadiran = [];
  String _currentCity;
  @override
  void initState() {
//    _kehadiran.add(widget.startingHome);
    super.initState();
  }

  @override
  void didUpdateWidget(HomeManager oldWidget) {}
  @override
  void changedDropDownItem(String selectedCity) {
    print("Selected city $selectedCity, we are going to refresh the UI");
    setState(() {
      _currentCity = selectedCity;
    });
    @override
    List<DropdownMenuItem<String>> getDropDownMenuItems() {
      List<DropdownMenuItem<String>> items = new List();
      for (String city in _cities) {
        items.add(new DropdownMenuItem(
            value: city,
            child: new Text(city)
        ));
      }
      return items;
    }
    @override
    Future<List<Data>> _getHadir() async {
      String api =
          'http://149.56.36.129/sekolah/api/time/3/2019/f17f6707fc2df7fb4a623670d2f60d7891df383513f696e432e31b53b414b466';
      final response = await http.get(api);
      print(response.body);
      Kehadiran responseJson = Kehadiran.fromJson(
          json.decode(response.body.toString()));
      List<Data> kehadiran = createKehadiran(responseJson.data);
      return kehadiran;
    }

    List<Data> createKehadiran(List<Data> data) {
      List<Data> list = new List();
      for (int i = 0; i < data.length; i++) {
        String idj = data[i].idj;
        String nim = data[i].nim;
        String tanggal = data[i].tanggal;
        String waktuMasuk = data[i].waktuMasuk;
        String waktuKeluar = data[i].waktuKeluar;
        String namaPenjemput = data[i].namaPenjemput;
        String tipePenjemput = data[i].tipePenjemput;
        Data hadir = new Data(
            idj: idj,
            nim: nim,
            tanggal: tanggal,
            waktuKeluar: waktuKeluar,
            waktuMasuk: waktuMasuk,
            namaPenjemput: namaPenjemput,
            tipePenjemput: tipePenjemput);
        list.add(hadir);
      }
      setState(() {
        _kehadiran = list;
      });
      return list;
    }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Column(children: [
        Container(
            margin: EdgeInsets.all(10.0),
            child: HomeControl(_getHadir)),
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
        Expanded(child: Home(_kehadiran))
      ]);
    }
  }

}


