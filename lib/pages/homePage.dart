import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';

import '../utils/income_handler.dart';
import '../utils/expense_handler.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override

  // https://pub.dev/packages/intl
  String formattedDate = '';

  // https://rizkysyawal.medium.com/handling-async-functions-in-flutters-initstate-211eda6a440d
  // https://pmatatias.medium.com/flutter-future-future-sync-future-microtask-future-value-etc-3f46aeae1210

  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<IncomeProvider>(context, listen: false).calculateTotal();
      Provider.of<ExpenseProvider>(context, listen: false).calculateTotal();
      getCurrentDate();
    });
  }

  // https://api.flutter.dev/flutter/intl/DateFormat-class.html
  void getCurrentDate() {
    DateTime now = DateTime.now();
    String formatted = DateFormat('MMMM d, y').format(now);

    setState(() {
      formattedDate = formatted;
    });
  }

  Widget build(BuildContext context) {
    final CollectionReference transactions =
        FirebaseFirestore.instance.collection('transactions');
    final income = Provider.of<IncomeProvider>(context).incomeTotal;
    final expense = Provider.of<ExpenseProvider>(context).expenseTotal;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(220),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 50.0, 0, 0),
                color: Color.fromRGBO(173, 223, 211, 1),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // TITLE
                      Text('KA-CHING!',
                          style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                              fontFamily: 'Jua',
                              fontWeight: FontWeight.bold)),

                      // APPBAR
                      Container(
                          height: 90.0,
                          width: 500.0,
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 230, 132, 91),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                  Icons.monetization_on_rounded,
                                                  size: 25.0,
                                                  color: Colors.white),
                                              Text("Balance",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          "Nunito Sans")),
                                            ],
                                          ),
                                          Text(
                                            "₱${income - expense}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Nunito Sans"),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.savings,
                                                  size: 25.0,
                                                  color: Colors.white),
                                              Text("Income",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          "Nunito Sans")),
                                            ],
                                          ),
                                          Text(
                                            "₱$income",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Nunito Sans"),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.credit_card,
                                                  size: 25.0,
                                                  color: Colors.white),
                                              Text("Expense",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          "Nunito Sans")),
                                            ],
                                          ),
                                          Text(
                                            "₱$expense",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Nunito Sans"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ])),
                    ]),
              ),
            ),

            // StreamBuilder to get and update data real-time
            body: StreamBuilder<QuerySnapshot>(
              stream: transactions.orderBy('id', descending: true).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator()); // loading graphic
                }

                final data =
                    snapshot.data!.docs; // refers to transactions data from db
                return ListView.builder(
                  itemCount: data.length + 2,
                  itemBuilder: (context, index) {
                    // title part
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "TODAY'S EXPENSES",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontFamily: 'Jua',
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                formattedDate,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                  fontFamily: 'Jua',
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    // transactions cards
                    if (index > 0 && index <= data.length) {
                      var item = data[index - 1];
                      return transactionCard(
                        // SEE WIDGET BELOW FOR CUSTOMIZATION
                        type: item['type'],
                        title: item['title'] ?? 'No title',
                        amount: item['amount'] ?? '0',
                      );
                    }

                    if (index == data.length + 1) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total: ",
                                style:
                                    TextStyle(fontSize: 30, fontFamily: "Jua"),
                              ),
                              Divider(
                                color: Color(0xFFE6845B),
                              ),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "₱${income} - ₱${expense}",
                                        style: TextStyle(
                                            fontFamily: "Nunito Sans",
                                            color: Color(0xFFE6845B),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      CircleAvatar(
                                          backgroundColor:
                                              Color.fromRGBO(173, 223, 211, 1),
                                          radius: 40,
                                          child: Text("₱${income - expense}",
                                              style: TextStyle(
                                                  fontFamily: "Nunito Sans",
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20))),
                                    ],
                                  ))
                            ],
                          ));
                    }
                  },
                );
              },
            ),
            bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: BottomAppBar(
                      color: Color.fromRGBO(173, 223, 211, 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('addIncome');
                            },
                            icon: Icon(Icons.savings),
                            iconSize: 40.0,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.home),
                            iconSize: 40.0,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('addExpense');
                            },
                            icon: Icon(Icons.credit_card),
                            iconSize: 40.0,
                          ),
                        ],
                      )),
                ))));
  }
}

Widget transactionCard(
    {required String type, required String title, required int amount}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    decoration: BoxDecoration(
      color: type == "income"
          ? Color.fromRGBO(170, 212, 205, 1)
          : Color.fromARGB(255, 230, 132, 91),
      borderRadius: BorderRadius.circular(24),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 16,
              child: Icon(
                type == "income" ? Icons.savings : Icons.credit_card,
                size: 20,
                color: type == "income"
                    ? Color.fromRGBO(170, 212, 205, 1)
                    : Color.fromARGB(255, 230, 132, 91),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Nunito Sans"),
                  ),
                  Text(
                    "this is where you'll be inserting the message bossing",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: "Nunito Sans"),
                  )
                ],
              ),
            )
          ],
        ),
        Text(
          type == "income" ? "+ ₱$amount" : "- ₱$amount",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Nunito Sans",
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}
