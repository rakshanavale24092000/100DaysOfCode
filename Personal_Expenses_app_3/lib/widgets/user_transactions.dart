
import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transactions.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {

  final List<Transactions> _userTransactions = [
    Transactions(
      id: 't1',
      amount: 2000,
      title: 'New Shoes',
      date: DateTime.now()
    ),
    Transactions(
      date:DateTime.now(),
      id: 't2',
      title: 'Vegetables',
      amount: 100 
    )
  ];

  void _addTransactions(String txTitle, double txAmount){
    final tx = Transactions(
      amount:txAmount,
      title: txTitle,
      id: DateTime.now().toString(),
      date: DateTime.now()
    );

    setState(() {
      _userTransactions.add(tx);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addTransactions),
        TransactionList(_userTransactions)
        

      ],
      
    );
  }
}