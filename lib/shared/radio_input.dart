import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:signals/signals_flutter.dart';

part '../.generated/shared/radio_input.g.dart';

class RadioOption {
  dynamic value;
  String label;

  RadioOption({required this.value, required this.label});
}

@swidget
Widget radioInput({
  required List<RadioOption> options,
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
      children: [
        ...options.map(
          (option) => RadioListTile(
            title: Text(option.label),
            value: option.value,
            groupValue: groupValue.watch(context),
            onChanged: handleSelection,
          ),
        ),
      ],
    );
  });
}
