import 'package:flutter/material.dart';
import 'package:trademate/home.dart' show HomeScreen;
import 'package:trademate/counter.dart' show CounterScreen;
import 'package:trademate/country.dart' show CountryScreen;
import 'package:trademate/album.dart' show AlbumScreen;

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
    Route(path:'/', name:'Home', screen:HomeScreen()),
    Route(path:'/counter', name:'Counter', screen:CounterScreen()),
    Route(path:'/country', name:'Country', screen:CountryScreen()),
    Route(path:'/album', name:'Album', screen:AlbumScreen())
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
        centerTitle: true,
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
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.plus_one), label: 'Counter'),
          NavigationDestination(icon: Icon(Icons.flag), label: 'Country'),
          NavigationDestination(icon: Icon(Icons.music_note), label: 'Album'),
        ],
      ),
      body: SelectionArea(child: widget.routes[widget.index].screen) , // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
