import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Grocery',
      amount: 499.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Mobile',
      amount: 1099.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Laptop',
      amount: 3000.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Car',
      amount: 45690.00,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      title: 'Daily Shop',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Center(
            child: Text(
              'Daily Expenses',
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.all(20),
                color: Colors.teal,
                child: Center(
                  child: Text(
                    'Chart',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Product',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Amount',
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.black,
                        side: BorderSide(
                          color: Colors.teal,
                          width: 4,
                          style: BorderStyle.solid,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Add Transaction',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                        child: Text(
                          ' \$${tx.amount}',
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMEd().add_jms().format(tx.date),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
