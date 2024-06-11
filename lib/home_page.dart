import 'package:expense_tracker/add_expense/add_expenses.dart';
import 'package:expense_tracker/expense_list/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Expense> _registerdExpenses = [
    Expense(
      title: 'asure',
      amount: '23.34',
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'scan',
      amount: '46.12',
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  void addExpenses(Expense expenses) {
    setState(() {
      _registerdExpenses.add(expenses);
    });
  }

  void removeExpenses(Expense expenses) {
    final expenseIndex = _registerdExpenses.indexOf(expenses);
    setState(() {
      _registerdExpenses.remove(expenses);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: const Text(
        'Expenses is deleted successfully',
      ),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerdExpenses.insert(expenseIndex, expenses);
            });
          }),
    ));
  }

  void _addExpensesPage() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return AddExpensesPage(
          addExpenses: addExpenses,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add your expenses.'),
        actions: [
          IconButton(
            onPressed: _addExpensesPage,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: _registerdExpenses.isEmpty
          ? const Center(child: Text('No Expenses Found, add some!!'))
          : Column(
              children: [
                const Text('Chart'),
                Expanded(
                  child: ExpenseList(
                    expensesList: _registerdExpenses,
                    removeExpenses: removeExpenses,
                  ),
                ),
              ],
            ),
    );
  }
}
