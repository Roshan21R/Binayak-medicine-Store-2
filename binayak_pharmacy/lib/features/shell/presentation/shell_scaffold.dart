import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellScaffold extends StatelessWidget {
  const ShellScaffold({super.key, required this.child});
  final Widget child;

  static const _destinations = [
    ('/', Icons.dashboard_outlined, 'Dashboard'),
    ('/medicines', Icons.medical_services_outlined, 'Medicines'),
    ('/sales', Icons.receipt_long_outlined, 'Sales'),
    ('/reports', Icons.bar_chart_outlined, 'Reports'),
    ('/notifications', Icons.notifications_outlined, 'Alerts'),
  ];

  int _indexForLocation(String location) {
    final index = _destinations.indexWhere((d) => location == d.$1);
    return index >= 0 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _indexForLocation(location);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Binayak Medicine Store'),
        actions: [
          IconButton(
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            icon: const Icon(Icons.menu),
            tooltip: 'Menu',
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 28, child: Icon(Icons.local_pharmacy)),
                  SizedBox(height: 8),
                  Text('Binayak Medicine Store'),
                  Text('Owner: Suman Sahu'),
                  Text('Created by Roshan'),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () => context.go('/about'),
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () => context.go('/reports'),
            ),
          ],
        ),
      ),
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (value) => context.go(_destinations[value].$1),
        destinations: _destinations
            .map((d) => NavigationDestination(icon: Icon(d.$2), label: d.$3))
            .toList(),
      ),
    );
  }
}