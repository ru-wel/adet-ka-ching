import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/income.dart';

class IncomeProvider with ChangeNotifier {

  final CollectionReference _incomesRef = FirebaseFirestore.instance.collection('transactions');

  double _incomeTotal = 0.0;

  double get incomeTotal => _incomeTotal;

  Future<void> addIncome(Income income) async {
    await _incomesRef.add({
      'type': income.type,
      'date': income.date,
      'amount': income.amount,
      'title': income.title,
      'message': income.message,
    });
    notifyListeners();
  }

  Stream<List<Income>> getIncomesStream() {
    return _incomesRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Income(
          date: doc['date'] ?? '',
          amount: doc['amount'] ?? '',
          title: doc['title'] ?? '',
          message: doc['message'] ?? '',
        );
      }).toList();
    });
  }

  Future<void> calculateTotal() async {
    QuerySnapshot snapshot = await _incomesRef.where('type', whereIn: ['income']).get();

    double income = 0.0;

    for (var doc in snapshot.docs) {
      var amount = (doc['amount'] as num).toDouble();
      if (doc['type'] == 'income') {
        income += amount;
      }
    }
    _incomeTotal = income;
    notifyListeners();
  }
}
