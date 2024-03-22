import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:tailwind_standards/tailwind_standards.dart';

part '../.generated/shared/base_input.g.dart';

@swidget
Widget baseInput(
    {required String title,
    TextInputType? keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    String? initialValue,
    String? error,
    String? prefix,
    String? suffix,
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
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          prefixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            alignment: Alignment.center,
            child: prefix != null
                ? TText(
                    prefix,
                    props: 'text-gray-500 text-sm',
                  )
                : null,
          ),
          suffixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            alignment: Alignment.center,
            child: suffix != null
                ? TText(
                    suffix,
                    props: 'text-gray-500 text-sm',
                  )
                : null,
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
