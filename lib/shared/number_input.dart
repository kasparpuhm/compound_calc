import 'package:compound_calc/shared/base_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInput extends StatelessWidget {
  final String title;
  final String? initialValue;
  final String? error;
  final void Function(String)? onChanged;

  const NumberInput({
    super.key,
    required this.title,
    this.initialValue,
    this.error,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BaseInput(
      title: title,
      initialValue: initialValue,
      error: error,
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
