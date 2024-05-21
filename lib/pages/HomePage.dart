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
          title: Text(
            'Viajes y Aventuras',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Text(
            'No hay un viaje seleccionado.',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentTrip.name,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(
            //   width: 200,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => BudgetPage()),
            //       );
            //     },
            //     child: Text(
            //       'Presupuesto',
            //       style: TextStyle(
            //         fontFamily: 'Montserrat',
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16,
            //         color: Colors.white, // Cambiar el color del texto a blanco
            //       ),
            //     ),
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.blueAccent,
            //       padding: EdgeInsets.symmetric(vertical: 16),
            //     ),
            //   ),
            // ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExpensePage()),
                  );
                },
                child: Text(
                  'Gastos',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white, // Cambiar el color del texto a blanco
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReportPage()),
                  );
                },
                child: Text(
                  'Reportes',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white, // Cambiar el color del texto a blanco
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
