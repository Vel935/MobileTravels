import 'package:flutter/material.dart';
import 'package:mobiletravels/pages/AddTripPage.dart';
import 'package:mobiletravels/pages/HomePage.dart';
import 'package:mobiletravels/providers/TripProvider.dart';
import 'package:provider/provider.dart';

class TripsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final trips = Provider.of<TripProvider>(context).trips;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Viajes',
          style: TextStyle(
            fontFamily: 'Montserrat', // Cambiar la fuente
            fontWeight: FontWeight.bold, // Texto en negrita
          ),
        ),
        centerTitle: true, // Centrar el título
        backgroundColor: Colors.blueAccent, // Cambiar el color del appbar
      ),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4, // Elevación de la tarjeta
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Margen
            child: ListTile(
              title: Text(
                trips[index].name,
                style: TextStyle(
                  fontSize: 18, // Tamaño de fuente
                  fontFamily: 'Montserrat', // Cambiar la fuente
                ),
              ),
              onTap: () {
                Provider.of<TripProvider>(context, listen: false)
                    .selectTrip(index);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTripPage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor:
            Colors.blueAccent, // Cambiar el color del botón flotante
      ),
    );
  }
}
