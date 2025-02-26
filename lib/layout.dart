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

class Layout extends StatefulWidget {
  final List<Route> routes = const [
    Route(path:'/counter', name:'Counter', screen:CounterScreen(), icon:Icons.plus_one),
    Route(path:'/country', name:'Country', screen:CountryScreen(), icon:Icons.flag),
    Route(path:'/sunflower', name:'Sunflower', screen:SunflowerScreen(), icon:Icons.yard),
    Route(path:'/brick-breaker', name:'Brick Braker', screen:BrickBreakerScreen(), icon:Icons.gamepad),
    Route(path:'/words', name:'Words', screen:WordsScreen(), icon:Icons.wordpress)
  ];
  final String title;
  final int index;
  final int breakpoint=600;

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
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= widget.breakpoint) {
      // widescreen: menu on the left, content on the right
      return Row(
        children: [
          SizedBox(
            width: 300,
            child: NavigationRail(
              extended: true,
              groupAlignment: 0, // center
              labelType: NavigationRailLabelType.none,
              onDestinationSelected: (index) => onScreenSelected(index),
              selectedIndex: widget.index,
              destinations: [
                for (final route in widget.routes)
                  NavigationRailDestination(
                    icon: Icon(route.icon),
                    label: Text(route.name),
                  ),
              ]
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.,
          Expanded(
            child: SelectionArea(child: widget.routes[widget.index].screen)
          ),
        ],
      );
    } else {
      // narrow screen: show content, menu inside drawer
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          centerTitle: true
        ),
        body: widget.routes[widget.index].screen,
        bottomNavigationBar: NavigationBar(
          selectedIndex: widget.index,
          onDestinationSelected: (index) => onScreenSelected(index),
          destinations: [
            for (final route in widget.routes)
              NavigationDestination(icon: Icon(route.icon), label: route.name),
          ],
        ),
        drawer: SizedBox(
          width: 300,
          child: Drawer(
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
        ),
      );
    }
  }
}
