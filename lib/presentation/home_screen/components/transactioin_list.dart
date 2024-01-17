import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/provider/transaction_provider.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_text.dart';

class TransactionList extends StatefulWidget {
  String title;
  String id;
  String amount;
  DateTime dateTime;

  TransactionList(
      {required this.amount,
      required this.title,
      required this.dateTime,
      required this.id});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  Color? _bgColor;

  @override
  void initState() {
    List<Color> availableColor = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];

    ///nextInt(4) take four num  means 0,1,2,3
    _bgColor = availableColor[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: CustomText(
                text: widget.amount,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        title: CustomText(
          text: widget.title,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),

        ///formatted date

        subtitle: CustomText(
          // text: DateFormat('yyyy-MM-dd').format(transaction[index].date),
          text: DateFormat.yMMMd().format(widget.dateTime),
          color: Colors.grey,
        ),
        trailing: IconButton(
          onPressed: () {
            provider.deleteTransaction(widget.id);
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
