import 'package:flutter/material.dart';
import 'package:demoapp/screens/counter.dart' show CounterScreen;
import 'package:demoapp/screens/country.dart' show CountryScreen;
import 'package:demoapp/screens/sunflower.dart' show SunflowerScreen;
import 'package:demoapp/screens/brick_breaker.dart' show BrickBreakerScreen;
import 'package:demoapp/screens/words.dart' show WordsScreen;

class Route {
  final String path;
  final String name;
  final Widget screen;
  final IconData icon;

  const Route({
    required this.path,
    required this.name,
    required this.screen,
    required this.icon,
  });
}

class Router {
  final List<Route> routes = const [
    Route(path:'/counter', name:'Counter', screen:CounterScreen(), icon:Icons.plus_one),
    Route(path:'/country', name:'Country', screen:CountryScreen(), icon:Icons.flag),
    Route(path:'/sunflower', name:'Sunflower', screen:SunflowerScreen(), icon:Icons.yard),
    Route(path:'/brick-breaker', name:'Brick Braker', screen:BrickBreakerScreen(), icon:Icons.gamepad),
    Route(path:'/words', name:'Words', screen:WordsScreen(), icon:Icons.wordpress)
  ];
  const Router();

  int getRouteIndex(String path) {
    return routes.indexWhere((route)=>route.path==path);
  }

  String getRouteName(String path) {
    return routes.firstWhere((route)=>route.path==path).name;
  }

  Widget getRouteScreen(String path) {
    return routes.firstWhere((route)=>route.path==path).screen;
  }
}