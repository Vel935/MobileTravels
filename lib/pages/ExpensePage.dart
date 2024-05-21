import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  final _expenseController = TextEditingController();
  final _categoryController = TextEditingController();
  List<Map<String, dynamic>> _expenses = [];

  void _addExpense() {
    setState(() {
      _expenses.add({
        'amount': double.parse(_expenseController.text),
        'category': _categoryController.text,
      });
    });
    _expenseController.clear();
    _categoryController.clear();
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: _addExpense,
              child: Text('Agregar Gasto'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _expenses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        '${_expenses[index]['category']}: \$${_expenses[index]['amount']}'),
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
