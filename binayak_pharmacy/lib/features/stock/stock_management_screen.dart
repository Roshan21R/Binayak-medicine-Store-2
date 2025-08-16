import 'package:flutter/material.dart';

class StockManagementScreen extends StatefulWidget {
  const StockManagementScreen({super.key});
  @override
  State<StockManagementScreen> createState() => _StockManagementScreenState();
}

class _StockManagementScreenState extends State<StockManagementScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Management'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: 'Stock In'), Tab(text: 'Stock Out'), Tab(text: 'Alerts')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [StockInForm(), Center(child: Text('Stock Out form here')), Center(child: Text('Low stock / expiry alerts'))],
      ),
    );
  }
}

class StockInForm extends StatelessWidget {
  const StockInForm({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Add Stock In', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        const _LabeledField(label: 'Medicine Name', hint: 'Enter medicine name'),
        const SizedBox(height: 12),
        const _LabeledField(label: 'Quantity', hint: 'Enter quantity', keyboard: TextInputType.number),
        const SizedBox(height: 12),
        const _LabeledField(label: 'Supplier', hint: 'Select supplier'),
        const SizedBox(height: 12),
        const _LabeledField(label: 'Batch Number', hint: 'Enter batch number'),
        const SizedBox(height: 12),
        const _LabeledField(label: 'Expiry Date', hint: 'mm/dd/yyyy'),
        const SizedBox(height: 16),
        FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.add), label: const Text('Add Stock')),
      ],
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
          decoration: InputDecoration(hintText: hint, border: const OutlineInputBorder()),
        ),
      ],
    );
  }
}