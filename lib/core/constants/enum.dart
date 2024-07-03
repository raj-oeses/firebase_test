//******************************************************************************Types of issues
enum AddItemEnum { medicine,sales }

extension AddItemEnumToString on AddItemEnum {
  String toShortString() => toString().split('.').last;
}
//******************************************************************************Types of issues
enum UnitTypeEnum { carton,unit }

extension UnitTypeEnumToString on UnitTypeEnum {
  String toShortString() => toString().split('.').last.capitalize();
}

//****Menu Items
enum MenuItemType { edit, delete }

////**************************to captilize first letter
//lower case after that
extension StringExtension on String {
  String capitalize() =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}
