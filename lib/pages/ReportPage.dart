import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  final List<Map<String, dynamic>> expenses;

  ReportPage({required this.expenses});

  @override
  Widget build(BuildContext context) {
    double totalExpenses =
        expenses.fold(0, (sum, item) => sum + item['amount']);

    return Scaffold(
      appBar: AppBar(
        title: Text('Reportes de Gastos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Total Gastado: \$${totalExpenses.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
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
