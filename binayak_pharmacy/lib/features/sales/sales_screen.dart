import 'package:flutter/material.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Center(
              child: Text('Daily Sales', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
            ),
            const SizedBox(height: 16),
            const Text('Item Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            const _LabeledField(label: 'Medicine Name', hint: 'e.g., Paracetamol'),
            const SizedBox(height: 12),
            Row(
              children: const [
                Expanded(child: _LabeledField(label: 'Quantity', hint: 'e.g., 2', keyboard: TextInputType.number)),
                SizedBox(width: 12),
                Expanded(child: _LabeledField(label: 'Rate (per unit)', hint: 'e.g., 10.50', keyboard: TextInputType.number)),
              ],
            ),
            const SizedBox(height: 12),
            const _LabeledField(label: 'GST (%)', hint: 'e.g., 5', keyboard: TextInputType.number),
            const SizedBox(height: 12),
            const _ReadOnlyField(label: 'Total Amount', value: 'Calculated automatically'),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            const Text('Customer Details (Optional)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            const _LabeledField(label: 'Mobile Number', hint: 'e.g., 9876543210', keyboard: TextInputType.phone),
            const SizedBox(height: 12),
            const _LabeledField(label: 'Customer Name', hint: 'e.g., John Doe'),
            const SizedBox(height: 12),
            Card(
              child: Container(
                height: 140,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: const Text('Upload a file or drag and drop\nPNG, JPG, GIF up to 10MB', textAlign: TextAlign.center),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.save_outlined),
              label: const Text('Save Sale'),
              style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(56)),
            ),
          ],
        ),
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({required this.label, required this.hint, this.keyboard});
  final String label;
  final String hint;
  final TextInputType? keyboard;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextField(
          keyboardType: keyboard,
          decoration: InputDecoration(border: const OutlineInputBorder(), hintText: hint),
        ),
      ],
    );
  }
}

class _ReadOnlyField extends StatelessWidget {
  const _ReadOnlyField({required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextField(
          enabled: false,
          decoration: InputDecoration(border: const OutlineInputBorder(), hintText: value),
        ),
      ],
    );
  }
}