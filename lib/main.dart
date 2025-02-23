import 'package:flutter/material.dart';
import 'layout.dart' show Layout;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Trademate',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Layout(index:0, title:'Home'),
      '/counter': (context) => Layout(index:1, title:'Counter'),
      '/country': (context) => Layout(index:2, title:'Country'),
      '/album': (context) => Layout(index:3, title:'Album'),
    },
    )
  );
}
