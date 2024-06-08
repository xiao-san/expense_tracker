import 'package:expense_tracker/expense_list/expense_items.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList(
      {super.key, required this.expensesList, required this.removeExpenses});

  final List<Expense> expensesList;
  final void Function(Expense expense) removeExpenses;

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.expensesList.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Expanded(
              child: ExpenseItems(
                expenseItem: widget.expensesList[index],
              ),
            ),
            IconButton(
                onPressed: () {
                  widget.removeExpenses(widget.expensesList[index]);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
          ],
        );
        // return Container(
        //   margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        //   decoration: BoxDecoration(
        //     border: Border.all(color: Colors.black),
        //   ),
        //   child: Column(
        //     children: [
        //       Text(widget.expensesList[index].id),
        //       Text(widget.expensesList[index].title),
        //       Text(widget.expensesList[index].amount.toString()),
        //       Text(widget.expensesList[index].category.toString()),
        //       Text(widget.expensesList[index].date.toString()),
        //     ],
        //   ),
        // );
      },
    );
  }
}
