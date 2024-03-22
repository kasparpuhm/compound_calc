import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:tailwind_standards/tailwind_standards.dart';

part '../.generated/shared/currency_input.g.dart';

const CURRENCY = (abbreviation: 'EUR', symbol: '€');

@swidget
Widget currencyInput() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(6.0)),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1.0,
            blurRadius: 2.0)
      ],
    ),
    child: TextFormField(
      decoration: InputDecoration(
        prefixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          alignment: Alignment.center,
          child: TText(
            CURRENCY.symbol,
            props: 'text-gray-500 text-sm',
          ),
        ),
        suffixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          alignment: Alignment.center,
          child: TText(
            CURRENCY.abbreviation,
            props: 'text-gray-500 text-sm',
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: TColor.gray300),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: TColor.indigo600, width: 2.0),
        ),
        focusColor: TColor.indigo600,
        contentPadding: const EdgeInsets.symmetric(vertical: 6.0),
      ),
      style: TextStyle(color: TColor.gray900),
    ),
  );
}
