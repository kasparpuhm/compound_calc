import 'package:compound_calc/shared/currency_input.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part '../../.generated/modules/interest-calculator/compound_interest_calculator.g.dart';

@swidget
Widget compoundInterestCalculator() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CurrencyInput(
            title: 'Initial investment',
            initialValue: '5000',
            error: 'hi',
          ),
        ),
        const CurrencyInput(
          title: 'Contribution amount',
          initialValue: '500',
        ),
      ],
    ),
  );
}
