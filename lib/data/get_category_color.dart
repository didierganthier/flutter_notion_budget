import 'package:flutter/material.dart';

Color? getCategoryColor(String category) {
  switch (category) {
    case 'Food':
      return Colors.red[400];
    case 'Utilities':
      return Colors.blue[400];
    case 'Transportation':
      return Colors.green[400];
    case 'Insurance':
      return Colors.purple[400];
    case 'Health':
      return Colors.orange[400];
    case 'Entertainment':
      return Colors.pink[400];
    case 'Shopping':
      return Colors.yellow[400];
    case 'Others':
      return Colors.grey[400];
    default:
      return Colors.white;
  }
}
