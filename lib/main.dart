// PACKAGE IMPORTS
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- firebase imports --
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// PAGE IMPORTS
import 'pages/AddExpense.dart';
import 'pages/AddIncome.dart';
import 'pages/HomePage.dart';
import 'pages/Transactions.dart';

// PROVIDER IMPORTS
import 'utils/expense_handler.dart';
import 'utils/income_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(routing());
}

class routing extends StatelessWidget {
  const routing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // https://davidserrano.io/flutter-state-management-made-easy-with-provider-2-provider-as-a-dependency-injection-framework-and-multiprovider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ExpenseProvider()..getExpensesStream()),
        ChangeNotifierProvider(
            create: (_) => IncomeProvider()..getIncomesStream()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "KA-CHING",
          home: const HomePage(),
          routes: {
            'addExpense': (BuildContext ctx) => AddExpenses(),
            'addIncome': (BuildContext ctx) => AddIncomes(),
            'transactions': (BuildContext ctx) => TransactionsPage(),
          }),
    );
  }
}
