import 'package:compound_calc/modules/interest-calculator/hooks/use_compound_interest_calculator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:signals/signals_flutter.dart';

CompoundInterestFormHook useCompoundInterestForm() {
  final calculator = useCompoundInterestCalculator();

  final initialInvestment = useMemoized(() => signal<int?>(5000));
  final contributionFrequency =
      useMemoized(() => signal(ContributionFrequency.monthly));
  final contributionAmount = useMemoized(() => signal<int?>(500));
  final years = useMemoized(() => signal<int?>(10));
  final estimatedReturn = useMemoized(() => signal<int?>(7));

  effect(
    () => calculator.calculate(
      initialInvestment: initialInvestment.value,
      contributionFrequency: contributionFrequency.value,
      contributionAmount: contributionAmount.value,
      years: years.value,
      estimatedReturn: estimatedReturn.value,
    ),
  );

  return CompoundInterestFormHook(
    initialInvestment: initialInvestment,
    contributionFrequency: contributionFrequency,
    contributionAmount: contributionAmount,
    years: years,
    estimatedReturn: estimatedReturn,
    initialInvestmentError: computed(() => initialInvestment.value == null
        ? "Initial investment is required, enter 0 to skip"
        : null),
    contributionAmountError: computed(() => contributionAmount.value == null
        ? "Contribution amount is required, enter 0 to skip"
        : null),
    yearsError: computed(() => _getYearsError(years.value)),
    estimatedReturnError: computed(() => estimatedReturn.value == null
        ? "Estimated return is required, enter 0 to skip"
        : null),
  );
}

class CompoundInterestFormHook {
  final Signal<int?> initialInvestment;
  final Signal<ContributionFrequency> contributionFrequency;
  final Signal<int?> contributionAmount;
  final Signal<int?> years;
  final Signal<int?> estimatedReturn;

  final Computed<String?> initialInvestmentError;
  final Computed<String?> contributionAmountError;
  final Computed<String?> yearsError;
  final Computed<String?> estimatedReturnError;

  CompoundInterestFormHook({
    required this.initialInvestment,
    required this.contributionFrequency,
    required this.contributionAmount,
    required this.years,
    required this.estimatedReturn,
    required this.initialInvestmentError,
    required this.contributionAmountError,
    required this.yearsError,
    required this.estimatedReturnError,
  });
}

enum ContributionFrequency { yearly, monthly }

String? _getYearsError(int? years) {
  if (years == null) return "Years is required";
  if (years < 1) return "Minimal year count is 1";
  return null;
}
