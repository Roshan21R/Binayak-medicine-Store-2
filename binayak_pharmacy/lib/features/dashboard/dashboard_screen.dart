import 'package:flutter/material.dart';
import 'package:binayak_pharmacy/features/ai/ai_widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Dashboard',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _StatCard(title: 'Total Medicines', value: '1,200')),
                const SizedBox(width: 12),
                Expanded(child: _StatCard(title: 'Total Sales', value: ' 5,500')),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Quick Actions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle_outline),
                    label: const Text('Add Medicine'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.bar_chart),
                    label: const Text('View Sales'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Alerts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            _AlertTile(
              icon: Icons.warning_amber_outlined,
              title: 'Low Stock',
              subtitle: '10 medicines are running low',
              color: Colors.orange,
            ),
            const SizedBox(height: 12),
            _AlertTile(
              icon: Icons.event_busy_outlined,
              title: 'Expiry Alerts',
              subtitle: '5 medicines are expiring soon',
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            const AiPromptCard(),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class _AlertTile extends StatelessWidget {
  const _AlertTile({required this.icon, required this.title, required this.subtitle, required this.color});
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color.withValues(alpha: 0.12), child: Icon(icon, color: color)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}