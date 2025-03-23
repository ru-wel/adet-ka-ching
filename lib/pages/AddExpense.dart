/*https://onlyflutter.com/how-to-display-and-customize-date-pickers-in-flutter*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../utils/expense_handler.dart';

/*class AddExpense extends StatelessWidget {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final CollectionReference expenses =
      FirebaseFirestore.instance.collection('transactions');

  void _saveExpense(BuildContext context) async {
    QuerySnapshot snapshot = await expenses.get();
    int count = snapshot.docs.length;
    int id = count + 1;

    await expenses.add({
      'id': id,
      'type': "expense",
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
        appBar: AppBar(
          title: Text(
            'ADD EXPENSE',
            style: TextStyle(fontFamily: 'Jua', color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(173, 223, 211, 1),
        ),
        body: Material(
          color: Color.fromRGBO(236, 236, 236, 100),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
                  child: TextField(
                      controller: _dateController,
                      decoration: InputDecoration(
                          labelText: 'Date',
                          labelStyle: TextStyle(color: Colors.black87),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: Color(0xFFE6845B))))),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
                  child: TextField(
                      controller: _amountController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                          labelText: 'Amount',
                          labelStyle: TextStyle(color: Colors.black87),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: Color(0xFFE6845B))))),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
                  child: TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle: TextStyle(color: Colors.black87),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: Color(0xFFE6845B))))),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
                  child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                          labelText: 'Message',
                          labelStyle: TextStyle(color: Colors.black87),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: Color(0xFFE6845B))))),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
                    child: ElevatedButton(
                      onPressed: () => _saveExpense(context),
                      child: Text(
                        'SAVE EXPENSE',
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'Jua'),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE6845B),
                          padding: EdgeInsets.all(20)),
                    )),
              ],
            ),
          )),
        ));
  }
}*/

class AddExpenses extends StatefulWidget {
  const AddExpenses({Key? key}) : super(key: key);

  @override
  State<AddExpenses> createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final CollectionReference expenses =
      FirebaseFirestore.instance.collection('transactions');

  void _saveExpense(BuildContext context) async {
    QuerySnapshot snapshot = await expenses.get();
    int count = snapshot.docs.length;
    int id = count + 1;

    await expenses.add({
      'id': id,
      'type': "expense",
      'date': _dateController.text,
      'amount': double.parse(_amountController.text),
      'title': _titleController.text,
      'message': _messageController.text,
    });
    Provider.of<ExpenseProvider>(context, listen: false).calculateTotal();
    Provider.of<ExpenseProvider>(context, listen: false).calculateTodayTotal();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'KA-CHING!',
            style:
                TextStyle(fontFamily: 'Jua', color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(173, 223, 211, 1),
        ),
        body: Material(
          color: Color.fromRGBO(236, 236, 236, 100),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(230, 132, 91, 1),
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text('EXPENSE',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Jua",
                              fontSize: 35)),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
                  child: TextField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: "Date",
                      labelStyle: TextStyle(color: Colors.black87),
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_today),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Color(0xFFE6845B))),
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectDate();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
                  child: TextField(
                      controller: _amountController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+(\.\d*)?')),
                      ],
                      decoration: InputDecoration(
                          labelText: 'Amount',
                          labelStyle: TextStyle(color: Colors.black87),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: Color(0xFFE6845B))))),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
                  child: TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                          labelText: 'Expense Title',
                          labelStyle: TextStyle(color: Colors.black87),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: Color(0xFFE6845B))))),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
                  child: TextField(
                      controller: _messageController,
                      maxLength: 50,
                      decoration: InputDecoration(
                          labelText: 'Message',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 60.0, horizontal: 10.0),
                          labelStyle: TextStyle(color: Colors.black87),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: Color(0xFFE6845B))))),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
                    child: ElevatedButton(
                      onPressed: () => _saveExpense(context),
                      child: Text(
                        'SAVE EXPENSE',
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'Jua'),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE6845B),
                          padding: EdgeInsets.all(20)),
                    )),
              ],
            ),
          )),
        ));
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? widget) => Theme(
        data: ThemeData(
          colorScheme: const ColorScheme.light(primary: Color(0xFFE6845B)),
          datePickerTheme: const DatePickerThemeData(
            backgroundColor: Colors.white,
            dividerColor: Color.fromRGBO(173, 223, 211, 1),
            headerBackgroundColor: Color.fromRGBO(173, 223, 211, 1),
            headerForegroundColor: Colors.white,
          ),
        ),
        child: widget!,
      ),
    );

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
