class Medicine {
  const Medicine({required this.id, required this.name, required this.batch, required this.expiry, required this.quantity});
  final String id;
  final String name;
  final String batch;
  final DateTime expiry;
  final int quantity;
}