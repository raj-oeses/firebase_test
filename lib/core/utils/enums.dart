//**----------------------------------------------------------------------------correct or incorrect
enum StatusEnum { correct, incorrect }

extension StatusEnumToString on StatusEnum {
  String toShortString() => toString().split('.').last.capitalize();
}


////**************************to captilize
extension StringExtension on String {
  String capitalize() =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}
