import 'package:flutter/material.dart';
import 'package:demoapp/router.dart' as librouter;

class Layout extends StatefulWidget {
  final router = librouter.Router();
  final String route;
  final int breakpoint=600;

  Layout({super.key, required this.route});

  @override
  State<Layout> createState() => _Layout();
}

class _Layout extends State<Layout> {

  void onScreenSelected(int index) {
    final String toRoute = widget.router.routes[index].path;
    Navigator.pushNamed(context,toRoute);
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
              selectedIndex: widget.router.getRouteIndex(widget.route),
              destinations: [
                for (final route in widget.router.routes)
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
            child: SelectionArea(child: widget.router.getRouteScreen(widget.route))
          ),
        ],
      );
    } else {
      // narrow screen: show content, menu inside drawer
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.router.getRouteName(widget.route)),
          centerTitle: true
        ),
        body: widget.router.getRouteScreen(widget.route),
        bottomNavigationBar: NavigationBar(
          selectedIndex: widget.router.getRouteIndex(widget.route),
          onDestinationSelected: (index) => onScreenSelected(index),
          destinations: [
            for (final route in widget.router.routes)
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
                for (final (index,route) in widget.router.routes.indexed)
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
