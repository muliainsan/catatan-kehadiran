import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

class Kehadiran {
  bool status;
  Null message;
  List<Data> data;

  Kehadiran({this.status, this.message, this.data});
//
  Kehadiran.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String idj;
  String nim;
  String tanggal;
  String waktuMasuk;
  String waktuKeluar;
  String namaPenjemput;
  String tipePenjemput;

  Data(
      {this.idj,
        this.nim,
        this.tanggal,
        this.waktuMasuk,
        this.waktuKeluar,
        this.namaPenjemput,
        this.tipePenjemput});

  Data.fromJson(Map<String, dynamic> json) {
    idj = json['idj'];
    nim = json['nim'];
    tanggal = json['tanggal'];
    waktuMasuk = json['waktu_masuk'];
    if(json['waktu_keluar']==null){
      waktuKeluar = "-";
      namaPenjemput = "-";
      tipePenjemput = "-";

    }else{
      waktuKeluar = json['waktu_keluar'];
      namaPenjemput = json['nama_penjemput'];
      tipePenjemput = json['tipe_penjemput'];
    }


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idj'] = this.idj;
    data['nim'] = this.nim;
    data['tanggal'] = this.tanggal;
    data['waktu_masuk'] = this.waktuMasuk;
    data['waktu_keluar'] = this.waktuKeluar;
    data['nama_penjemput'] = this.namaPenjemput;
    data['tipe_penjemput'] = this.tipePenjemput;
    return data;
  }
}
