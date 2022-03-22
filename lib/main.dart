import 'package:flutter/material.dart';
import 'package:flutter_calculator/providers/calculator_provider.dart';
import 'package:flutter_calculator/screens/calculator/calculator_view.dart';
import 'package:flutter_calculator/utils/common.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final calculatorProvider = ChangeNotifierProvider((ref) {
  return CalculatorChangeNotifier();
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Common.primaryColor,
          background: const Color(0xff363d4f),
        ),
        scaffoldBackgroundColor: const Color(0xff363d4f),
        dividerColor: Common.primaryColor,
      ),
      home: const CalculatorView(),
      initialRoute: '/',
    );
  }
}
