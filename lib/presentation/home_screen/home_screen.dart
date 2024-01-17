import 'dart:io';

import 'package:flutter/material.dart';
import 'package:personal_expenses_app/presentation/home_screen/components/add_new_transaction.dart';
import 'package:personal_expenses_app/presentation/home_screen/components/transactioin_list.dart';
import 'package:personal_expenses_app/provider/transaction_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: CustomText(
          text: 'Personal Expenses',
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            onPressed: () {
              _buildShowModalBottomSheet(context);
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          /// this class is called on a floating action button
          // AddTransaction(),
          Consumer<TransactionProvider>(
            builder: (context, transactionProvider, child) {
              return Expanded(
                child: transactionProvider.transactionList.isEmpty
                    ? Column(
                        children: [
                          CustomText(
                            text: 'No Transactions Added Yet',
                            color: Theme.of(context).primaryColor,
                            fontSize: 24,
                          ),
                          SizedBox(height: 20),
                          Image.asset(
                            'assets/images/waiting.png',
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                        ],
                      )
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: transactionProvider.transactionList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return TransactionList(
                            amount:
                                '\$${transactionProvider.transactionList[index].amount.toStringAsFixed(2)}',
                            title: transactionProvider
                                .transactionList[index].title,
                            dateTime:
                                transactionProvider.transactionList[index].date,
                            id: transactionProvider.transactionList[index].id
                                .toString(),
                          );
                        }),
              );
            },
          )
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Platform.isIOS

          ///if it is in iphone mobile , then there will not be floating action button
          ? Container()
          : FloatingActionButton(
              onPressed: () {
                _buildShowModalBottomSheet(context);
              },
              child: Icon(Icons.add),
            ),
    );
  }

  Future<dynamic> _buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: AddTransaction(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
}
