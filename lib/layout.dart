import 'package:flutter/material.dart';
import 'package:trademate/home.dart' show HomeScreen;
import 'package:trademate/counter.dart' show CounterScreen;
import 'package:trademate/country.dart' show CountryScreen;
import 'package:trademate/album.dart' show AlbumScreen;

class MyRoute {
  final int index;
  final String path;
  final String name;
  final Widget screen;

  const MyRoute({
    required this.index,
    required this.path,
    required this.name,
    required this.screen,
  });
}

class Layout extends StatefulWidget {
  final List<MyRoute> routes = const [
    MyRoute(index:0, path:'/', name:'Home', screen:HomeScreen()),
    MyRoute(index:1, path:'/counter', name:'Counter', screen:CounterScreen()),
    MyRoute(index:2, path:'/country', name:'Country', screen:CountryScreen()),
    MyRoute(index:3, path:'/album', name:'Album', screen:AlbumScreen())
  ];
  final Map<int,String> routesMap = const {
    0: '/',
    1: '/counter',
    2: '/country',
    3: '/album',
  };
  final Map<int,Widget> screens = const {
    0: HomeScreen(),
    1: CounterScreen(),
    2: CountryScreen(),
    3: AlbumScreen(),
  };
  final String title;
  final int index;

  const Layout({super.key, required this.index, required this.title});

  @override
  State<Layout> createState() => _Layout();
}

class _Layout extends State<Layout> {

  void onScreenSelected(int index) {
    final String route = widget.routes.elementAt(index).path;
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
            for (var route in widget.routes)
              ListTile(
                title: Text(route.name),
                onTap: () => onScreenSelected(route.index),
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
