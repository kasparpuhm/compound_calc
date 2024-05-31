import 'package:compound_calc/modules/interest-calculator/hooks/use_compound_interest_form.dart';
import 'package:signals/signals_flutter.dart';

final state = signal<CompoundState?>(null);

CompoundInterestCalculatorHook useCompoundInterestCalculator() {
  void calculate({
    required int? initialInvestment,
    required ContributionFrequency contributionFrequency,
    required int? contributionAmount,
    required int? years,
    required int? estimatedReturn,
  }) {
    if (initialInvestment == null ||
        contributionAmount == null ||
        years == null ||
        estimatedReturn == null) {
      return state.value = null;
    }

    final totalContribution = contributionAmount *
        years *
        (contributionFrequency == ContributionFrequency.monthly ? 12 : 1);
    final totalFutureValue = initialInvestment +
        totalContribution +
        (initialInvestment + totalContribution) *
            years *
            estimatedReturn ~/
            100;

    state.value = CompoundState(
      totalFutureValue: totalFutureValue,
      totalContribution: totalContribution,
    );
  }

  return CompoundInterestCalculatorHook(
    state: computed(() => state.value),
    calculate: calculate,
  );
}

class CompoundInterestCalculatorHook {
  final Computed<CompoundState?> state;
  final void Function({
    required int? initialInvestment,
    required ContributionFrequency contributionFrequency,
    required int? contributionAmount,
    required int? years,
    required int? estimatedReturn,
  }) calculate;

  CompoundInterestCalculatorHook(
      {required this.state, required this.calculate});
}

class CompoundState {
  final int totalFutureValue;
  final int totalContribution;

  const CompoundState({
    required this.totalFutureValue,
    required this.totalContribution,
  });
}
