import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  final _budgetController = TextEditingController();
  double _budget = 0.0;

  void _saveBudget() {
    setState(() {
      _budget = double.parse(_budgetController.text);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Presupuesto guardado: \$$_budget')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Presupuesto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _budgetController,
              decoration:
                  InputDecoration(labelText: 'Introduce tu presupuesto'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveBudget,
              child: Text('Guardar Presupuesto'),
            ),
          ],
        ),
      ),
    );
  }
}
