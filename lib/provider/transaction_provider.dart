import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/transaction_model.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transactionList = [];

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void addNewTransaction(String newTitle, double newAmount, DateTime dateTime) {
    transactionList.add(
      Transaction(
        id: DateTime.now().toString(),
        title: newTitle,
        amount: newAmount,
        date: dateTime,
      ),
    );
    notifyListeners();
    titleController.clear();
    amountController.clear();
  }

  void deleteTransaction(String id) {
    transactionList.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }

  // List<Transaction> transactionList = [
  //   Transaction(
  //     id: 't1',
  //     title: 'New Shoes',
  //     amount: 69.99,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: 't2',
  //     title: 'Weekly Grociers',
  //     amount: 19.99,
  //     date: DateTime.now(),
  //   ),
  // ];
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
