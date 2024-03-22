import 'package:compound_calc/shared/base_input.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
part '../.generated/shared/currency_input.g.dart';

const CURRENCY = (abbreviation: 'EUR', symbol: '€');

@swidget
Widget currencyInput(
    {required String title,
    String? initialValue,
    String? error,
    void Function(String)? onChanged}) {
  return BaseInput(
    title: title,
    initialValue: initialValue,
    error: error,
    prefix: CURRENCY.symbol,
    suffix: CURRENCY.abbreviation,
    onChanged: onChanged,
  );
}
