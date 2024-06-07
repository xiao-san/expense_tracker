// import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

enum Category { food, travel, leasure, work }

const uuid = Uuid();

class Expense {
  Expense({
    // required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
