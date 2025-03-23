import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final CollectionReference transactions =
      FirebaseFirestore.instance.collection('transactions');

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
      body: StreamBuilder<QuerySnapshot>(
        stream: transactions.orderBy('date', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.docs;

          // group transactions according to date
          // basically parang
          // {
          //  '2025-03-21' : [lahat ng transactions for that date]
          // }
          Map<String, List<QueryDocumentSnapshot>> groupedData = {};
          for (var doc in data) {
            final date = doc['date'] as String;
            if (!groupedData.containsKey(date)) {
              groupedData[date] = [];
            }
            groupedData[date]!.add(doc);
          }

          return ListView(
            children: groupedData.entries.map((entry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16),
                    child: Text(
                      entry.key, // date string e.g. '2025-03-21'
                      style: const TextStyle(
                        fontFamily: "Jua",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  // list transactions for that date
                  ...entry.value.map((doc) {
                    return ListTile(
                      title: Text(
                        doc['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Nunito Sans",
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        doc['message'] ?? '',
                        style: TextStyle(
                            color: Colors.grey, fontFamily: "Nunito Sans"),
                      ),
                      trailing: Text(
                        '₱${doc['amount']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: "Nunito Sans",
                          color: doc['type'] == 'income'
                              ? Color.fromRGBO(173, 223, 211, 1)
                              : Color.fromRGBO(230, 132, 91, 1),
                        ),
                      ),
                      leading: Icon(
                        doc['type'] == 'income'
                            ? Icons.savings
                            : Icons.credit_card,
                        color: doc['type'] == 'income'
                            ? Color.fromRGBO(173, 223, 211, 1)
                            : Color.fromRGBO(230, 132, 91, 1),
                      ),
                    );
                  }).toList(),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
