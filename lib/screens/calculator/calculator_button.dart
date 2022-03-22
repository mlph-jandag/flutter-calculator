import 'package:flutter/material.dart';
import 'package:flutter_calculator/main.dart';
import 'package:flutter_calculator/providers/calculator_provider.dart';
import 'package:flutter_calculator/utils/common.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalculatorButton extends HookConsumerWidget {
  final String label;
  final bool isSpecial;
  final bool isOperator;
  final bool isEqualSign;

  const CalculatorButton(this.label,
      {Key? key,
      this.isSpecial = false,
      this.isOperator = false,
      this.isEqualSign = false})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenData = MediaQuery.of(context).size;

    final calculatorChangeNotifier = ref.watch(calculatorProvider);

    return InkWell(
      onTap: () {
        _onButtonClick(calculatorChangeNotifier, label);
      },
      child: Container(
        color: isOperator
            ? Common.primaryBgColor
            : isEqualSign
                ? Common.primaryColor
                : Common.secondaryColor,
        child: Center(
          child: Text(
            label,
            style: isSpecial
                ? Common.calculatorBtnTextStyle
                    .copyWith(color: Common.primaryColor)
                : Common.calculatorBtnTextStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Future<void> _onButtonClick(
      CalculatorChangeNotifier calculatorChangeNotifier, String label) async {
    return calculatorChangeNotifier.onType(label);
  }
}
