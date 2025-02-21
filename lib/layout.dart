import 'package:flutter/material.dart';
import 'home.dart' show HomeScreen;
import 'counter.dart' show CounterScreen;
import 'country.dart' show CountryScreen;
import 'album.dart' show AlbumScreen;

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _Layout();
}

class _Layout extends State<Layout> {
  final String title = 'Trademate';
  final List<Widget> screens = const [
    HomeScreen(),
    CounterScreen(),
    CountryScreen(),
    AlbumScreen(),
  ];
  int _selectedIndex = 0;
  Widget _selectedScreen = const HomeScreen();
  final globalKey = GlobalKey<ScaffoldState>();

  void _onScreenSelected(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedScreen = screens.elementAt(index);
    });
    globalKey.currentState?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        centerTitle: true,
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () => _onScreenSelected(0),
            ),
            ListTile(
              title: const Text('Button'),
              onTap: () => _onScreenSelected(1),
            ),
            ListTile(
              title: const Text('Country'),
              onTap: () => _onScreenSelected(2),
            ),
            ListTile(
              title: const Text('Album'),
              onTap: () => _onScreenSelected(3),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => _onScreenSelected(index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.plus_one), label: 'Counter'),
          NavigationDestination(icon: Icon(Icons.flag), label: 'Country'),
          NavigationDestination(icon: Icon(Icons.music_note), label: 'Album'),
        ],
      ),
      body:
          _selectedScreen, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
