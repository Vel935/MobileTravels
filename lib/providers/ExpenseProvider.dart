import 'package:flutter/material.dart';

class ExpenseProvider with ChangeNotifier {
  double _budget = 0.0;
  List<Map<String, dynamic>> _expenses = [];

  double get budget => _budget;
  List<Map<String, dynamic>> get expenses => _expenses;

  void setBudget(double budget) {
    _budget = budget;
    notifyListeners();
  }

  void addExpense(double amount, String category) {
    _expenses.add({'amount': amount, 'category': category});
    notifyListeners();
  }
}
