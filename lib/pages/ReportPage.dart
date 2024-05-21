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
          backgroundColor: Colors.blueAccent, // Color del appbar
        ),
        body: Center(
          child: Text('No hay un viaje seleccionado.'),
        ),
      );
    }

    double totalExpenses =
        currentTrip.expenses.fold(0, (sum, item) => sum + item['amount']);
    double currentMoney = currentTrip.budget - totalExpenses;

    Color currentMoneyColor =
        currentMoney >= 0 ? Colors.green : Colors.red; // Color del texto

    return Scaffold(
      appBar: AppBar(
        title: Text('Reportes de Gastos'),
        backgroundColor: Colors.blueAccent, // Color del appbar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alineación a la izquierda
          children: [
            Text(
              // Texto del título de la lista de gastos
              'Totales',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              // Contenedor para los totales
              width:
                  double.infinity, // Abarcar toda la pantalla horizontalmente
              margin: EdgeInsets.only(bottom: 20), // Margen inferior
              padding: EdgeInsets.all(16), // Relleno interno
              decoration: BoxDecoration(
                // Decoración del contenedor
                color: Colors.blue[100], // Color de fondo
                borderRadius: BorderRadius.circular(10), // Bordes redondeados
              ),
              child: Column(
                // Contenido del contenedor
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Alineación a la izquierda
                children: [
                  Text(
                    // Texto del presupuesto
                    'Presupuesto:',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    // Monto del presupuesto
                    '\$${currentTrip.budget.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    // Texto del total gastado
                    'Total Gastado: ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red, // Color del texto en rojo
                    ),
                  ),
                  Text(
                    // Monto del total gastado
                    '\$${totalExpenses.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red, // Color del texto en rojo
                    ),
                  ),
                  Text(
                    // Texto del dinero actual
                    'Dinero Actual: ',
                    style: TextStyle(
                      fontSize: 20,
                      color:
                          currentMoneyColor, // Color del texto según la condición
                    ),
                  ),
                  Text(
                    // Monto del dinero actual
                    '\$${currentMoney.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      color:
                          currentMoneyColor, // Color del texto según la condición
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Espaciador vertical
            Text(
              // Texto del título de la lista de gastos
              'Gastos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // Espaciador vertical
            Expanded(
              // Contenedor para la lista de gastos
              child: Container(
                padding: EdgeInsets.all(16), // Relleno interno
                decoration: BoxDecoration(
                  // Decoración del contenedor
                  color: Colors.blue[100], // Color de fondo
                  borderRadius: BorderRadius.circular(10), // Bordes redondeados
                ),
                child: ListView.builder(
                  // Lista de gastos
                  itemCount: currentTrip.expenses.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        '${currentTrip.expenses[index]['category']}: \$${currentTrip.expenses[index]['amount']}',
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
