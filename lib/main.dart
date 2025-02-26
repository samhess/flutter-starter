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
      '/counter': (context) => Layout(route:'/counter'),
      '/country': (context) => Layout(route:'/country'),
      '/sunflower': (context) => Layout(route:'/sunflower'),
      '/brick-breaker': (context) => Layout(route:'/brick-breaker'),
      '/words': (context) => Layout(route:'/words'),
    },
    )
  );
}
