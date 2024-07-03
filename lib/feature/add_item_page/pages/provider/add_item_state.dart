
import 'package:test_project/core/constants/constants.dart';

class AddItemState {
  final DateTime? selectedDay;
  final String? totalPrice;
  final String? unitType;
  final String? imagePath;

  AddItemState({
    this.selectedDay,
    this.totalPrice = '0.0',
    this.unitType = firstUnitType,
    this.imagePath,
  });

  AddItemState copy({
    DateTime? selectedDay,
    String? totalPrice,
    String? unitType,
    String? imagePath,
  }) =>
      AddItemState(
        selectedDay: selectedDay ?? this.selectedDay,
        totalPrice: totalPrice ?? this.totalPrice,
        unitType: unitType ?? this.unitType,
        imagePath: imagePath ?? this.imagePath,
      );
}
