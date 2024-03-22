import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:tailwind_standards/tailwind_standards.dart';

part '../.generated/shared/currency_input.g.dart';

const CURRENCY = (abbreviation: 'EUR', symbol: '€');

@swidget
Widget currencyInput(
    {required String title,
    String? initialValue,
    String? error,
    void Function(String)? onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: TText(
          title,
          props: 'text-sm font-medium text-gray-900',
        ),
      ),
      TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: TColor.red600),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: TColor.red600, width: 2.0),
          ),
          focusColor: TColor.indigo600,
          error: error != null
              ? TText(
                  error,
                  props: 'text-red-600 text-s',
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(vertical: 6.0),
        ),
        style: TextStyle(color: TColor.gray900),
      ),
    ],
  );
}
