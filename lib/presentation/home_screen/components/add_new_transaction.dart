import 'package:flutter/material.dart';
import 'package:personal_expenses_app/model/transaction_model.dart';
import 'package:personal_expenses_app/provider/transaction_provider.dart';
import 'package:personal_expenses_app/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';

class AddTransaction extends StatefulWidget {
  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  late final DateTime _selectedDate;

  void submitData() {
    ///initialize provider
    final transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);

    if (transactionProvider.amountController.text.isEmpty) {
      return;
    }

    ///store data in variables
    final enteredTitle = transactionProvider.titleController.text;
    final enteredAmount =
        double.parse(transactionProvider.amountController.text);

    ///validation
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    ///else block
    transactionProvider.addNewTransaction(
        enteredTitle, enteredAmount, _selectedDate);

    ///when you enter new product , then botton sheet disappear
    Navigator.pop(context);
  }

  ///method for selecting date
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.0,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextField(
                labelText: 'Title',
                controller: transactionProvider.titleController,
                onFieldSubmitted: (value) {
                  submitData();

                  ///OR
                  // transactionProvider.addNewTransaction(
                  //   transactionProvider.titleController.text,
                  //   double.parse(transactionProvider.amountController.text),
                  // );
                },
              ),
              CustomTextField(
                labelText: 'Amount',
                keyboardType: TextInputType.number,
                controller: transactionProvider.amountController,
                onFieldSubmitted: (value) {
                  submitData();

                  ///OR
                  // transactionProvider.addNewTransaction(
                  //   transactionProvider.titleController.text,
                  //   double.parse(transactionProvider.amountController.text),
                  // );
                },
                // onChanged: (value){},
              ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'No Date Choosen!',
                    ),
                    CustomButton(
                      width: 150,
                      btnText: 'Choose Data',
                      textColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        _presentDatePicker();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                btnText: 'Add Transaction',
                // onChanged: (value){},
                onPressed: () {
                  submitData();

                  ///OR
                  // transactionProvider.addNewTransaction(
                  //   transactionProvider.titleController.text,
                  //   double.parse(transactionProvider.amountController.text),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
