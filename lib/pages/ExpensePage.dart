import 'package:flutter/material.dart';
import 'package:mobiletravels/providers/TripProvider.dart';
import 'package:provider/provider.dart';

class ExpensePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // Clave para el formulario
  final _expenseController = TextEditingController();
  final _categoryController = TextEditingController();

  void _addExpense(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final amount = double.parse(_expenseController.text);
      final category = _categoryController.text;
      Provider.of<TripProvider>(context, listen: false)
          .addExpenseToCurrentTrip(amount, category);
      _expenseController.clear();
      _categoryController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentTrip = Provider.of<TripProvider>(context).currentTrip;
    final expenses = currentTrip?.expenses ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gastos',
          style: TextStyle(
            fontFamily: 'Montserrat', // Cambiar la fuente
            fontWeight: FontWeight.bold, // Texto en negrita
          ),
        ),
        backgroundColor: Colors.blueAccent, // Cambiar el color del appbar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Asociar el formulario con la clave
          child: Column(
            children: [
              TextFormField(
                controller: _expenseController,
                decoration: InputDecoration(
                  labelText: 'Cantidad',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce la cantidad';
                  }
                  // Validar que el valor sea numérico
                  if (double.tryParse(value) == null) {
                    return 'Por favor, introduce un valor numérico válido';
                  }
                  return null;
                },
                style: TextStyle(fontFamily: 'Montserrat'), // Cambiar la fuente
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(
                  labelText: 'Categoría',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce la categoría';
                  }
                  return null;
                },
                style: TextStyle(fontFamily: 'Montserrat'), // Cambiar la fuente
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double
                    .infinity, // Ajustar el ancho del botón al ancho disponible
                child: ElevatedButton(
                  onPressed: () => _addExpense(context),
                  child: Text(
                    'Agregar Gasto',
                    style: TextStyle(
                      fontFamily: 'Montserrat', // Cambiar la fuente
                      fontWeight: FontWeight.bold, // Texto en negrita
                      color: Colors.white, // Cambiar el color del texto
                      fontSize: 16, // Tamaño del texto
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blueAccent, // Cambiar el color del botón
                    padding: EdgeInsets.symmetric(
                        vertical: 16), // Añadir espacio alrededor del texto
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: expenses.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        '${expenses[index]['category']}: \$${expenses[index]['amount']}',
                        style: TextStyle(
                          fontFamily: 'Montserrat', // Cambiar la fuente
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
