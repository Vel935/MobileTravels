import 'package:flutter/material.dart';
import 'package:mobiletravels/providers/TripProvider.dart';
import 'package:provider/provider.dart';

class AddTripPage extends StatelessWidget {
  final _nameController = TextEditingController();
  final _budgetController = TextEditingController();

  void _addTrip(BuildContext context) {
    final name = _nameController.text;
    final budget = double.parse(_budgetController.text);
    Provider.of<TripProvider>(context, listen: false).addTrip(name, budget);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Viaje'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre del Viaje'),
            ),
            TextField(
              controller: _budgetController,
              decoration: InputDecoration(labelText: 'Presupuesto'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _addTrip(context),
              child: Text('Agregar Viaje'),
            ),
          ],
        ),
      ),
    );
  }
}
