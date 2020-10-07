import 'package:flutter/foundation.dart';

class transactions{
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  transactions({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date
  });
}