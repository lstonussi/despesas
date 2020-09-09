import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double valor;
  final DateTime date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.date,
    @required this.valor,
  });
}
