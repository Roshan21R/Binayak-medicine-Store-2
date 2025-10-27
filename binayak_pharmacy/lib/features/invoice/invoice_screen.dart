import 'package:flutter/material.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = const [
      ('Medicine A', '100mg', 1, 10.00),
      ('Medicine B', '50mg', 2, 7.50),
      ('Medicine C', '200mg', 1, 12.00),
    ];
    final subtotal = items.fold<double>(0, (s, e) => s + e.$3 * e.$4);
    final gst = subtotal * 0.05;
    final total = subtotal + gst;

    return Scaffold(
      appBar: AppBar(title: const Text('New Invoice')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search or scan medicine',
                suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code_scanner)),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, i) {
                final it = items[i];
                return ListTile(
                  leading: Container(width: 56, height: 56, color: Colors.blueGrey.shade100),
                  title: Text(it.$1),
                  subtitle: Text(it.$2),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.remove_circle_outline)),
                      Text('${it.$3}'),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle_outline)),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: items.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _line('Subtotal', subtotal),
                _line('GST (5%)', gst),
                const Divider(),
                _line('Total', total, isBold: true),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.print),
                        label: const Text('Print'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.download),
                        label: const Text('Download PDF'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _line(String label, double amount, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.w700 : FontWeight.w400)),
        Text(' ${amount.toStringAsFixed(2)}', style: TextStyle(fontWeight: isBold ? FontWeight.w700 : FontWeight.w400)),
      ],
    );
  }
}