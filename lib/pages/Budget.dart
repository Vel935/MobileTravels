import 'package:flutter/material.dart';
import 'package:mobiletravels/providers/TripProvider.dart';
import 'package:provider/provider.dart';

class BudgetPage extends StatelessWidget {
  final _budgetController = TextEditingController();

  void _saveBudget(BuildContext context) {
    final budget = double.parse(_budgetController.text);
    Provider.of<TripProvider>(context, listen: false)
        .setBudgetForCurrentTrip(budget);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content:
              Text('Presupuesto guardado: \$${budget.toStringAsFixed(2)}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTrip = Provider.of<TripProvider>(context).currentTrip;

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
              decoration: InputDecoration(
                labelText: 'Introduce tu presupuesto',
                hintText: currentTrip?.budget.toString() ?? '0.0',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveBudget(context),
              child: Text('Guardar Presupuesto'),
            ),
          ],
        ),
      ),
    );
  }
}
