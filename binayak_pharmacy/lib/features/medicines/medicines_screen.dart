import 'package:flutter/material.dart';

class MedicinesScreen extends StatelessWidget {
  const MedicinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('Aspirin', '123456', '12/2025', 100, 'In Stock', Colors.blue),
      ('Ibuprofen', '789012', '06/2024', 150, 'In Stock', Colors.red),
      ('Paracetamol', '345678', '03/2026', 10, 'Low Stock', Colors.orange),
      ('Amoxicillin', '901234', '10/2025', 50, 'In Stock', Colors.blue),
      ('Ciprofloxacin', '567890', '01/2023', 0, 'Out of Stock', Colors.grey),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text('Medicines', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search medicines (e.g., Name, Batch, Code)',
                  prefixIcon: const Icon(Icons.search),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: items.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final i = items[index];
                  final qtyColor = i.$4 == 0
                      ? Colors.red
                      : i.$4 < 20
                          ? Colors.orange
                          : Theme.of(context).colorScheme.primary;
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(backgroundColor: i.$6.withValues(alpha: 0.12), child: const Icon(Icons.medical_services_outlined)),
                      title: Text(i.$1, style: const TextStyle(fontWeight: FontWeight.w700)),
                      subtitle: Text('Batch: ${i.$2} | Expires: ${i.$3}'),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('${i.$4}', style: TextStyle(fontSize: 20, color: qtyColor, fontWeight: FontWeight.bold)),
                          Text(i.$5),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}