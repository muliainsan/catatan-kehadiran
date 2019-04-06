import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:play_group/kehadiran.dart';
import './home_manager.dart';
import './home_control.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<Data> asd = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.teal),
        home: Scaffold(
            appBar: AppBar(
              title: Text('home'),
            ),
            body: HomeManager(asd)));
  }

  Future<List<Data>> _getHadir() async {
    String api =
        'http://149.56.36.129/sekolah/api/time/3/2019/f17f6707fc2df7fb4a623670d2f60d7891df383513f696e432e31b53b414b466';
    final response = await http.get(api);
    print(response.body);
    List responseJson = json.decode(response.body) as List;
    List<Data> kehadiran = createKehadiran(responseJson);
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
    return list;
  }
}
