import 'package:expense_tracker/expense_list/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Expense> _registerdExpenses = [
    Expense(
      title: 'asure',
      amount: 23.34,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'scan',
      amount: 46.21,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpenseList(
              expensesList: _registerdExpenses,
            ),
          ),
        ],
      ),
    );
  }
}
