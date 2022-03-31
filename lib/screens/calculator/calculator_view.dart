import 'package:flutter/material.dart';
import 'package:flutter_calculator/main.dart';
import 'package:flutter_calculator/screens/calculator/calculator_button.dart';
import 'package:flutter_calculator/utils/common.dart';
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
      body: Column(
        children: [
          SizedBox(
            height: screenData.height * 0.25,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          calculatorChangeNotifier.equation,
                          style: Common.resultTextStyle.copyWith(
                            fontSize: calculatorChangeNotifier.equationFontSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          calculatorChangeNotifier.result,
                          style: Common.resultTextStyle.copyWith(
                              fontSize:
                                  calculatorChangeNotifier.resultFontSize),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 2, height: 2),
          _buildCalculatorButtons(),
        ],
      ),
    );
  }

  Widget _buildCalculatorButtons() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CalculatorButton('7'),
              CalculatorButton('8'),
              CalculatorButton('9'),
              CalculatorButton(
                '/',
                isSpecial: true,
                isOperator: true,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CalculatorButton('4'),
              CalculatorButton('5'),
              CalculatorButton('6'),
              CalculatorButton(
                'x',
                isSpecial: true,
                isOperator: true,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CalculatorButton('1'),
              CalculatorButton('2'),
              CalculatorButton('3'),
              CalculatorButton(
                '-',
                isSpecial: true,
                isOperator: true,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CalculatorButton('0'),
              CalculatorButton('.'),
              CalculatorButton('=', isEqualSign: true),
              CalculatorButton(
                '+',
                isSpecial: true,
                isOperator: true,
              ),
            ],
          )
        ],
      ),
      flex: 2,
    );
  }
}
