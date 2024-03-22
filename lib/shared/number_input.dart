import 'package:compound_calc/shared/base_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part '../.generated/shared/number_input.g.dart';

@swidget
Widget numberInput(
    {required String title,
    String? initialValue,
    String? error,
    void Function(String)? onChanged}) {
  return BaseInput(
    title: title,
    initialValue: initialValue,
    error: error,
    onChanged: onChanged,
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  );
}
