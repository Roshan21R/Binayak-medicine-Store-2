import 'package:binayak_pharmacy/domain/medicine/medicine.dart';

abstract class MedicineRepository {
  Future<List<Medicine>> getAll();
  Future<void> add(Medicine medicine);
}

class InMemoryMedicineRepository implements MedicineRepository {
  final List<Medicine> _items = [];
  @override
  Future<void> add(Medicine medicine) async {
    _items.add(medicine);
  }

  @override
  Future<List<Medicine>> getAll() async => List.unmodifiable(_items);
}