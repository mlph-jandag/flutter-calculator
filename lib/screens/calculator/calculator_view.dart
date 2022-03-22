import 'package:flutter/material.dart';
import 'package:flutter_calculator/providers/calculator_provider.dart';
import 'package:flutter_calculator/screens/calculator/calculator_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CalculatorView extends HookWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenData = MediaQuery.of(context).size;

    final calculatorChangeNotifier =
        useChangeNotifierListenable(CalculatorChangeNotifier());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Calculator'),
      ),
      body: Column(children: [
        Container(
          height: screenData.height * 0.3,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Center(child: Text(calculatorChangeNotifier.equation)),
                ),
              ),
              Expanded(
                child: Container(
                  child: Center(child: Text(calculatorChangeNotifier.result)),
                ),
              )
            ],
          ),
        ),
        const Divider(thickness: 2, height: 2),
        Expanded(
          child: Container(
            width: double.infinity,
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              childAspectRatio: 1.3,
              physics: NeverScrollableScrollPhysics(),
              children: _buildCalculatorButtons(),
            ),
          ),
        ),
      ]),
    );
  }

  List<Widget> _buildCalculatorButtons() {
    return [
      CalculatorButton(
        'AC',
        isSpecial: true,
      ),
      CalculatorButton(
        '⌫',
        isSpecial: true,
      ),
      CalculatorButton(
        '+/-',
        isSpecial: true,
      ),
      CalculatorButton(
        '÷',
        isSpecial: true,
        isOperator: true,
      ),
      CalculatorButton('7'),
      CalculatorButton('8'),
      CalculatorButton('9'),
      CalculatorButton(
        'x',
        isSpecial: true,
        isOperator: true,
      ),
      CalculatorButton('4'),
      CalculatorButton('5'),
      CalculatorButton('6'),
      CalculatorButton(
        '-',
        isSpecial: true,
        isOperator: true,
      ),
      CalculatorButton('1'),
      CalculatorButton('2'),
      CalculatorButton('3'),
      CalculatorButton(
        '+',
        isSpecial: true,
      ),
      CalculatorButton('0'),
      CalculatorButton('00'),
      CalculatorButton('.'),
      CalculatorButton('=', isEqualSign: true),
    ];
  }

  Future<void> _incrementCounter(
      CalculatorChangeNotifier calculatorChangeNotifier) async {}
}
