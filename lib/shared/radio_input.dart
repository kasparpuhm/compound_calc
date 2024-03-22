import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:signals/signals_flutter.dart';
import 'package:tailwind_standards/tailwind_standards.dart';

part '../.generated/shared/radio_input.g.dart';

class RadioOption {
  dynamic value;
  String label;

  RadioOption({required this.value, required this.label});
}

@swidget
Widget radioInput({
  required List<RadioOption> options,
  required String title,
  required dynamic initialValue,
  required void Function(dynamic value)? onChanged,
}) {
  final groupValue = signal<dynamic>(initialValue);

  void handleSelection(dynamic value) {
    groupValue.value = value;
    if (onChanged != null) onChanged(value);
  }

  return Builder(builder: (context) {
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
        ...options.map(
          (option) => RadioListTile(
            activeColor: TColor.indigo600,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 0.0,
              vertical: 0.0,
            ),
            title: TText(
              option.label,
              props: 'font-medium text-gray-900',
            ),
            value: option.value,
            groupValue: groupValue.watch(context),
            onChanged: handleSelection,
          ),
        ),
      ],
    );
  });
}
