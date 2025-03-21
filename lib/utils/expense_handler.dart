import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseProvider with ChangeNotifier {

  final CollectionReference _expensesRef = FirebaseFirestore.instance.collection('transactions');

  double _expenseTotal = 0.0;
  double _todayTotal = 0.0;

  double get expenseTotal => _expenseTotal;
  double get todayExpenseTotal => _todayTotal;

  Future<void> addExpense(Expense expense) async {
    await _expensesRef.add({
      'type': expense.type,
      'date': expense.date,
      'amount': expense.amount,
      'title': expense.title,
      'message': expense.message,
    });
    notifyListeners();
  }

  Stream<List<Expense>> getExpensesStream() {
    return _expensesRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Expense(
          date: doc['date'] ?? '',
          amount: doc['amount'] ?? '',
          title: doc['title'] ?? '',
          message: doc['message'] ?? '',
        );
      }).toList();
    });
  }

  Future<void> calculateTotal() async {
    QuerySnapshot snapshot = await _expensesRef.where('type', whereIn: ['expense']).get();

    double expense = 0.0;

    for (var doc in snapshot.docs) {
      var amount = (doc['amount'] as num).toDouble();
      if (doc['type'] == 'expense') {
        expense += amount;
      }
    }
    _expenseTotal = expense;
    notifyListeners();
  }

  Future<void> calculateTodayTotal() async {
    final today = DateTime.now();
    final formattedToday =
        "${today.year.toString().padLeft(4, '0')}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

    QuerySnapshot snapshot = await _expensesRef
        .where('type', whereIn: ['expense'])
        .where('date', isEqualTo: formattedToday)
        .get();

    double expenseToday = 0.0;

    for (var doc in snapshot.docs) {
      var amount = (doc['amount'] as num).toDouble();
      expenseToday += amount;
    }

    _todayTotal = expenseToday;
    notifyListeners();
  }
}
