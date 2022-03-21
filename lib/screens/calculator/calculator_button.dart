import 'package:flutter/material.dart';
import 'package:flutter_calculator/utils/common.dart';

class CalculatorButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final screenData = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        print('btn tap $label');
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
}
