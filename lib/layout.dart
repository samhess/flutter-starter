import 'package:flutter/material.dart';
import 'home.dart' show HomeScreen;
import 'button.dart' show ButtonScreen;
import 'country.dart' show CountryScreen;

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _Layout();
}

class _Layout extends State<Layout> {
  final String title = 'Trademate';
  final List<Widget> screens = const [
    HomeScreen(),
    ButtonScreen(),
    CountryScreen(),
  ];
  int _selectedIndex = 0;
  Widget _selectedScreen = const HomeScreen();

  void _onScreenSelected(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedScreen = screens.elementAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              decoration: BoxDecoration(color: Colors.blue),
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
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => _onScreenSelected(index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.check), label: 'Test'),
          NavigationDestination(icon: Icon(Icons.flag), label: 'Country'),
        ],
      ),
      body:
          _selectedScreen, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
