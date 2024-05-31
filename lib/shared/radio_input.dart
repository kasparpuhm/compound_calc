import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:tailwind_standards/tailwind_standards.dart';

class RadioOption<T> {
  T value;
  String label;

  RadioOption({required this.value, required this.label});
}

class RadioInput<T> extends StatelessWidget {
  final List<RadioOption> options;
  final String title;
  final T initialValue;
  final void Function(T value)? onChanged;

  const RadioInput({
    super.key,
    required this.options,
    required this.title,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final groupValue = signal<dynamic>(initialValue);

    void handleSelection(dynamic value) {
      groupValue.value = value;
      if (onChanged != null) onChanged!(value);
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
}
