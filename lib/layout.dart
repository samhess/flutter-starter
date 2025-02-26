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

  const Route({
    required this.path,
    required this.name,
    required this.screen,
  });
}

class Layout extends StatefulWidget {
  final List<Route> routes = const [
    Route(path:'/counter', name:'Counter', screen:CounterScreen()),
    Route(path:'/country', name:'Country', screen:CountryScreen()),
    Route(path:'/sunflower', name:'Sunflower', screen:SunflowerScreen()),
    Route(path:'/brick-breaker', name:'Brick Braker', screen:BrickBreakerScreen()),
    Route(path:'/words', name:'Words', screen:WordsScreen())
  ];
  final String title;
  final int index;

  const Layout({super.key, required this.index, required this.title});

  @override
  State<Layout> createState() => _Layout();
}

class _Layout extends State<Layout> {

  void onScreenSelected(int index) {
    final String route = widget.routes[index].path;
    Navigator.pushNamed(context,route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('Menu'),
            ),
            for (final (index,route) in widget.routes.indexed)
              ListTile(
                title: Text(route.name),
                onTap: () => onScreenSelected(index),
              )
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.index,
        onDestinationSelected: (index) => onScreenSelected(index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.plus_one), label: 'Counter'),
          NavigationDestination(icon: Icon(Icons.flag), label: 'Country'),
          NavigationDestination(icon: Icon(Icons.yard), label: 'Sunflower'),
          NavigationDestination(icon: Icon(Icons.gamepad), label: 'Brick Braker'),
          NavigationDestination(icon: Icon(Icons.wordpress), label: 'Words'),
        ],
      ),
      body: SizedBox(
        child: SelectionArea(child: widget.routes[widget.index].screen),
      ) , // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
