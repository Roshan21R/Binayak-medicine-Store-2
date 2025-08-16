import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final alerts = [
      ('Low Stock', 'Paracetamol is below threshold', Colors.orange),
      ('Expiring Soon', 'Ibuprofen batch 789012 expires in 10 days', Colors.red),
      ('Backup Complete', 'Your data was backed up to cloud', Colors.green),
    ];
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemCount: alerts.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final a = alerts[i];
            return ListTile(
              leading: CircleAvatar(backgroundColor: a.$3.withValues(alpha: 0.12), child: Icon(Icons.notifications, color: a.$3)),
              title: Text(a.$1, style: const TextStyle(fontWeight: FontWeight.w700)),
              subtitle: Text(a.$2),
              trailing: const Icon(Icons.chevron_right),
            );
          },
        ),
      ),
    );
  }
}