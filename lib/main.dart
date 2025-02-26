import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'layout.dart' show Layout;

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Demo App',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    ),
    initialRoute: '/counter',
    routes: {
      '/counter': (context) => Layout(index:0, title:'Counter'),
      '/country': (context) => Layout(index:1, title:'Country'),
      '/sunflower': (context) => Layout(index:2, title:'Sunflower'),
      '/brick-breaker': (context) => Layout(index:3, title:'Brick Braker'),
      '/words': (context) => Layout(index:4, title:'Words'),
    },
    )
  );
}
