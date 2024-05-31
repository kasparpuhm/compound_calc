import 'package:compound_calc/modules/interest-calculator/hooks/use_compound_interest_calculator.dart';
import 'package:compound_calc/modules/interest-calculator/hooks/use_compound_interest_form.dart';
import 'package:compound_calc/shared/currency_input.dart';
import 'package:compound_calc/shared/number_input.dart';
import 'package:compound_calc/shared/radio_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:signals/signals_flutter.dart';

class CompoundInterestCalculator extends HookWidget {
  const CompoundInterestCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    final CompoundInterestFormHook form = useCompoundInterestForm();
    final CompoundInterestCalculatorHook calculator =
        useCompoundInterestCalculator();

    Widget buildInitialInvestmentField() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: CurrencyInput(
          title: 'Initial investment',
          initialValue: form.initialInvestment.value.toString(),
          onChanged: (value) => form.initialInvestment.value =
              value.isEmpty ? null : int.parse(value),
          error: form.initialInvestmentError.watch(context),
        ),
      );
    }

    Widget buildContributionFrequencyField() {
      return RadioInput<ContributionFrequency>(
        options: _frequencyOptions,
        title: 'Contribution frequency',
        initialValue: form.contributionFrequency.value,
        onChanged: (value) => form.contributionFrequency.value = value,
      );
    }

    Widget buildContributionAmountField() {
      return CurrencyInput(
        title: 'Contribution amount',
        initialValue: form.contributionAmount.value.toString(),
        onChanged: (value) => form.contributionAmount.value =
            value.isEmpty ? null : int.parse(value),
        error: form.contributionAmountError.watch(context),
      );
    }

    Widget buildYearsField() {
      return NumberInput(
        title: 'Years',
        initialValue: form.years.value.toString(),
        onChanged: (value) =>
            form.years.value = value.isEmpty ? null : int.parse(value),
        error: form.yearsError.watch(context),
      );
    }

    Widget buildEstimatedReturnField() {
      return NumberInput(
        title: 'Estimated return',
        initialValue: form.estimatedReturn.value.toString(),
        onChanged: (value) => form.estimatedReturn.value =
            value.isEmpty ? null : int.parse(value),
        error: form.estimatedReturnError.watch(context),
      );
    }

    Widget buildResults() {
      return Text(
        "The total amount is: ${calculator.state.watch(context)?.totalFutureValue} and the total contribution is: ${calculator.state.watch(context)?.totalContribution}",
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        runSpacing: 20.0,
        children: [
          buildInitialInvestmentField(),
          buildContributionFrequencyField(),
          buildContributionAmountField(),
          buildYearsField(),
          buildEstimatedReturnField(),
          if (calculator.state.watch(context) != null) buildResults(),
        ],
      ),
    );
  }
}

final List<RadioOption<ContributionFrequency>> _frequencyOptions = [
  RadioOption(value: ContributionFrequency.yearly, label: 'Yearly'),
  RadioOption(value: ContributionFrequency.monthly, label: 'Monthly'),
];
