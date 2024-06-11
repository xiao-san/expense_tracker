import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

class AddExpensesPage extends StatefulWidget {
  const AddExpensesPage({super.key, required this.addExpenses});

  final Function(Expense expenses) addExpenses;

  @override
  State<AddExpensesPage> createState() => _AddExpensesPageState();
}

class _AddExpensesPageState extends State<AddExpensesPage> {
  DateTime? selectedDate;
  var selectedCategory = Category.food;

  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  void _addDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(now.year - 10, DateTime.january, DateTime.sunday),
        lastDate: DateTime(now.year + 50, now.month, now.day));
    setState(() {
      selectedDate = pickedDate;
    });
    print(selectedDate);
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    amountController.dispose();
  }

  void _submitExpenses() {
    final enteredTitle = titleController.text.trim();
    final enteredAmount = amountController.text.trim();
    final enteredDate = selectedDate;

    if (enteredTitle.isEmpty || enteredAmount.isEmpty || enteredDate == null) {
      showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: const Text('invalid input'),
                content: const Text('please enter the required fields'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Yes')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('No'))
                ],
              ));
    }
    widget.addExpenses(Expense(
        title: titleController.text,
        amount: amountController.text,
        date: selectedDate!,
        category: selectedCategory));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      // width: double.infinity,
      // child: Column(
      //   children: [Text('ajkdbaskbjasd')],
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: titleController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextFormField(
                    controller: amountController,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: ' Amount',
                      prefix: Text('\$ '),
                    ),
                  ),
                ),
                const Spacer(),
                Text(selectedDate == null
                    ? 'Pick a Date'
                    : formatter.format(selectedDate!)),
                IconButton(
                    onPressed: _addDatePicker,
                    icon: const Icon(Icons.calendar_month))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton(
                    value: selectedCategory,
                    items: Category.values
                        .map(
                          (val) => DropdownMenuItem(
                              value: val, child: Text(val.name.toString())),
                        )
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedCategory = val!;
                      });
                    }),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('cancel')),
                ElevatedButton(
                    onPressed: () {
                      // print(titleController.text);
                      // print(amountController.text);
                      // print(selectedDate);
                      // print(selectedCategory);
                      // print(titleController.text);
                      _submitExpenses();
                    },
                    child: const Text('save')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
