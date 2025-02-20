import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'country.dart' show RandomCountryPage;
import 'button.dart' show ButtonPage;

class Layout extends StatelessWidget {
  const Layout({super.key});
  final String title='Moontrade';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LayoutController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index) => controller.selectedIndex.value = index,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.check),
            label: 'Test',
          ),
          NavigationDestination(
            icon: Icon(Icons.info),
            label: 'Country',
          ),
        ],
      ),
      body: Obx(()=>controller.screens[controller.selectedIndex.value]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LayoutController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    Container(color: Colors.orange),
    const ButtonPage(title: 'foo',),
    const RandomCountryPage(title: 'foo2',)
  ];
}

