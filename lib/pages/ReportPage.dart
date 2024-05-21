import 'package:flutter/material.dart';
import 'package:mobiletravels/providers/TripProvider.dart';
import 'package:provider/provider.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTrip = Provider.of<TripProvider>(context).currentTrip;

    if (currentTrip == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Reportes de Gastos'),
        ),
        body: Center(
          child: Text('No hay un viaje seleccionado.'),
        ),
      );
    }

    double totalExpenses =
        currentTrip.expenses.fold(0, (sum, item) => sum + item['amount']);
    double currentMoney = currentTrip.budget - totalExpenses;

    return Scaffold(
      appBar: AppBar(
        title: Text('Reportes de Gastos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Presupuesto: \$${currentTrip.budget.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Total Gastado: \$${totalExpenses.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Dinero Actual: \$${currentMoney.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: currentTrip.expenses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        '${currentTrip.expenses[index]['category']}: \$${currentTrip.expenses[index]['amount']}'),
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
