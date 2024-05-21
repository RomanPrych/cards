import 'dart:convert';

extension StringExtention on String {
  Map<String, int> toSort() {
    Map<String, int> returnedValue = {};
    Map<String, dynamic>? tempValue = jsonDecode(this);
    tempValue?.forEach(
        (key, value) => returnedValue[value] = int.tryParse('$key') ?? 0);
    return returnedValue;
  }
}
