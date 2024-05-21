import 'package:flutter/material.dart';
import 'package:mobiletravels/providers/TripProvider.dart';
import 'package:provider/provider.dart';

class ExpensePage extends StatelessWidget {
  final _expenseController = TextEditingController();
  final _categoryController = TextEditingController();

  void _addExpense(BuildContext context) {
    final amount = double.parse(_expenseController.text);
    final category = _categoryController.text;
    Provider.of<TripProvider>(context, listen: false)
        .addExpenseToCurrentTrip(amount, category);
    _expenseController.clear();
    _categoryController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final currentTrip = Provider.of<TripProvider>(context).currentTrip;
    final expenses = currentTrip?.expenses ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Gastos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _expenseController,
              decoration: InputDecoration(labelText: 'Cantidad'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Categoría'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _addExpense(context),
              child: Text('Agregar Gasto'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        '${expenses[index]['category']}: \$${expenses[index]['amount']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
