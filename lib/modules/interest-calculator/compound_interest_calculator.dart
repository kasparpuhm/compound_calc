import 'package:compound_calc/shared/currency_input.dart';
import 'package:compound_calc/shared/number_input.dart';
import 'package:compound_calc/shared/radio_input.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:signals/signals_flutter.dart';

part '../../.generated/modules/interest-calculator/compound_interest_calculator.g.dart';

@swidget
Widget compoundInterestCalculator() {
  final initialInvestmentValue = signal('5000');

  final initialInvestmentError = computed(() =>
      initialInvestmentValue.value.isEmpty
          ? 'Please enter initial investment sum!'
          : null);

  final List<RadioOption> frequencyOptions = [
    RadioOption(value: 'YEARLY', label: 'Yearly'),
    RadioOption(value: 'MONTHLY', label: 'Monthly'),
  ];

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Builder(builder: (context) {
            return CurrencyInput(
              title: 'Initial investment',
              initialValue: initialInvestmentValue.value,
              onChanged: (value) => initialInvestmentValue.value = value,
              error: initialInvestmentError.watch(context),
            );
          }),
        ),
        const CurrencyInput(
          title: 'Contribution amount',
          initialValue: '500',
        ),
        const NumberInput(title: 'Years of growth'),
        const NumberInput(title: 'Estimated average return'),
        RadioInput(
          options: frequencyOptions,
          initialValue: frequencyOptions[0].value,
          onChanged: (v) => print(v),
        )
      ],
    ),
  );
}
