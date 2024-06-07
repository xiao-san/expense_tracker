import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItems extends StatelessWidget {
  const ExpenseItems({super.key, required this.expenseItem});

  final Expense expenseItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      color: Colors.deepPurple.shade100,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              expenseItem.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('\$ ${expenseItem.amount.toString()}'),
                const Spacer(),
                Text(formatter.format(expenseItem.date)),
                const SizedBox(
                  width: 10,
                ),
                Icon(categoryIcons[expenseItem.category])
              ],
            )
          ],
        ),
      ),
    );
  }
}
