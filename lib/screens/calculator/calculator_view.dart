import 'package:flutter/material.dart';
import 'package:flutter_calculator/main.dart';
import 'package:flutter_calculator/screens/calculator/calculator_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalculatorView extends HookConsumerWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenData = MediaQuery.of(context).size;

    final calculatorChangeNotifier = ref.watch(calculatorProvider);

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(calculatorChangeNotifier.equation),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(child: Text(calculatorChangeNotifier.result)),
              )
            ],
          ),
        ),
        const Divider(thickness: 2, height: 2),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              childAspectRatio: 1.3,
              physics: const NeverScrollableScrollPhysics(),
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
        '+/-',
        isSpecial: true,
      ),
      CalculatorButton(
        '%',
        isSpecial: true,
      ),
      CalculatorButton(
        'DEL',
        isSpecial: true,
        isOperator: true,
      ),
      CalculatorButton('7'),
      CalculatorButton('8'),
      CalculatorButton('9'),
      CalculatorButton(
        '/',
        isSpecial: true,
        isOperator: true,
      ),
      CalculatorButton('4'),
      CalculatorButton('5'),
      CalculatorButton('6'),
      CalculatorButton(
        'x',
        isSpecial: true,
        isOperator: true,
      ),
      CalculatorButton('1'),
      CalculatorButton('2'),
      CalculatorButton('3'),
      CalculatorButton(
        '-',
        isSpecial: true,
        isOperator: true,
      ),
      CalculatorButton('0'),
      CalculatorButton('.'),
      CalculatorButton('=', isEqualSign: true),
      CalculatorButton(
        '+',
        isSpecial: true,
        isOperator: true,
      ),
    ];
  }
}
