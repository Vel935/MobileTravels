import 'package:flutter/material.dart';

class Trip {
  final String name;
  double budget;
  final List<Map<String, dynamic>> expenses;

  Trip({required this.name, required this.budget, required this.expenses});
}

class TripProvider with ChangeNotifier {
  List<Trip> _trips = [];
  Trip? _currentTrip;

  List<Trip> get trips => _trips;
  Trip? get currentTrip => _currentTrip;

  void addTrip(String name, double budget) {
    _trips.add(Trip(name: name, budget: budget, expenses: []));
    notifyListeners();
  }

  void selectTrip(int index) {
    _currentTrip = _trips[index];
    notifyListeners();
  }

  void addExpenseToCurrentTrip(double amount, String category) {
    if (_currentTrip != null) {
      _currentTrip!.expenses.add({'amount': amount, 'category': category});
      notifyListeners();
    }
  }

  void setBudgetForCurrentTrip(double budget) {
    if (_currentTrip != null) {
      _currentTrip!.budget = budget;
      notifyListeners();
    }
  }
}
