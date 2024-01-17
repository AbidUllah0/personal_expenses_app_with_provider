import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses_app/presentation/home_screen/home_screen.dart';
import 'package:personal_expenses_app/provider/transaction_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
      ],
      child: Platform.isIOS

          ///this is for IOS / Iphone
          ? CupertinoApp(
              debugShowCheckedModeBanner: false,
              title: 'Personal Expenses App',
              home: HomeScreen(),
            )
          : MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Personal Expenses App',
              theme: ThemeData(
                primarySwatch: Colors.purple,
              ),
              home: HomeScreen(),
            ),
    );
  }
}
