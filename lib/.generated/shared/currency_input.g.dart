// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../shared/currency_input.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class CurrencyInput extends StatelessWidget {
  const CurrencyInput({
    Key? key,
    required this.title,
    this.initialValue,
    this.error,
    this.onChanged,
  }) : super(key: key);

  final String title;

  final String? initialValue;

  final String? error;

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext _context) => currencyInput(
        title: title,
        initialValue: initialValue,
        error: error,
        onChanged: onChanged,
      );
}
