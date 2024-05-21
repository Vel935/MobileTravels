import 'package:flutter/material.dart';
import 'package:mobiletravels/providers/TripProvider.dart';
import 'package:provider/provider.dart';

class AddTripPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // Clave para el formulario
  final _nameController = TextEditingController();
  final _budgetController = TextEditingController();

  void _addTrip(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final budget = double.parse(_budgetController.text);
      Provider.of<TripProvider>(context, listen: false).addTrip(name, budget);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agregar Viaje',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Asociar el formulario con la clave
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre del Viaje',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce el nombre del viaje';
                  }
                  return null;
                },
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _budgetController,
                decoration: InputDecoration(
                  labelText: 'Presupuesto',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce el presupuesto';
                  }
                  // Validar que el valor sea numérico
                  if (double.tryParse(value) == null) {
                    return 'Por favor, introduce un valor numérico válido';
                  }
                  return null;
                },
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _addTrip(context),
                child: Text(
                  'Agregar Viaje',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
