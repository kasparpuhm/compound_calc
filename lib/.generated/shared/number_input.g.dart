// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../shared/number_input.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class NumberInput extends StatelessWidget {
  const NumberInput({
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
  Widget build(BuildContext _context) => numberInput(
        title: title,
        initialValue: initialValue,
        error: error,
        onChanged: onChanged,
      );
}
