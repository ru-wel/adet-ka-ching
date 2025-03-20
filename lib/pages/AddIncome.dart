import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddIncome extends StatelessWidget {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final CollectionReference incomes = FirebaseFirestore.instance.collection('transactions');

  void _saveIncome(BuildContext context) async {

    QuerySnapshot snapshot = await incomes.get();
    int count = snapshot.docs.length;
    int id = count + 1;

    await incomes.add({
      'id' : id,
      'type': "income",
      'date': _dateController.text,
      'amount': int.parse(_amountController.text),
      'title': _titleController.text,
      'message': _messageController.text,
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Income')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date')),
            TextField(
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Amount')),
            TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title')),
            TextField(
                controller: _messageController,
                decoration: InputDecoration(labelText: 'Message')),
            ElevatedButton(
              onPressed: () => _saveIncome(context),
              child: Text('Save Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
