import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './home_manager.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.teal),
        home: Scaffold(
            appBar: AppBar(
              title: Text('home'),
            ),
            body: HomeManager(
              startingHome: 'hadir boz',
            )));
  }
}
