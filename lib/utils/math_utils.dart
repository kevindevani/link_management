import 'package:flutter/material.dart';

double getSizeWidth(BuildContext context, double percentage) {
  return (percentage * ((MediaQuery.of(context).size.width))) / 100;
}

double getSizeHeight(BuildContext context, double percentage) {
  return (percentage * ((MediaQuery.of(context).size.height))) / 100;
}

double getFontSize(BuildContext context, double percentage) {
  return (percentage * ((MediaQuery.of(context).size.width) / 3)) / 100;
}

extension DoubleExtension on double {
  /// Vertical Spaced SizedBox
  Widget get toVSB {
    return SizedBox(height: this);
  }

  /// Horizontal Spaced SizedBox
  Widget get toHSB {
    return SizedBox(width: this);
  }
}

String getRoundOff(String value, {int fractionCount = 2}) {
  try {
    var number = double.tryParse(value);
    return (number?.toStringAsFixed(fractionCount)) ??
        0.toStringAsFixed(fractionCount);
  } catch (e) {
    return 0.toStringAsFixed(fractionCount);
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
