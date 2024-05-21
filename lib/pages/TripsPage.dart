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
        title: Text('Lista de Viajes'),
      ),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(trips[index].name),
            onTap: () {
              Provider.of<TripProvider>(context, listen: false)
                  .selectTrip(index);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
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
      ),
    );
  }
}
