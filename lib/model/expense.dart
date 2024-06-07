// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Category { food, travel, leasure, work }

final formatter = DateFormat.yMMMd();

const categoryIcons = {
  Category.food: Icons.dining,
  Category.travel: Icons.travel_explore,
  Category.leasure: Icons.book,
  Category.work: Icons.work,
};

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

  String get formatterDate {
    return formatter.format(date);
  }
}
