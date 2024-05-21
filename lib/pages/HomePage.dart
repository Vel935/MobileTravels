import 'package:flutter/material.dart';
import 'package:mobiletravels/pages/Budget.dart';
import 'package:mobiletravels/pages/ExpensePage.dart';
import 'package:mobiletravels/pages/ReportPage.dart';
import 'package:mobiletravels/providers/TripProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTrip = Provider.of<TripProvider>(context).currentTrip;

    if (currentTrip == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Viajes y Aventuras'),
        ),
        body: Center(
          child: Text('No hay un viaje seleccionado.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentTrip.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => BudgetPage()),
            //     );
            //   },
            //   child: Text('Presupuesto'),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExpensePage()),
                );
              },
              child: Text('Gastos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportPage()),
                );
              },
              child: Text('Reportes'),
            ),
          ],
        ),
      ),
    );
  }
}
