// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../shared/radio_input.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class RadioInput extends StatelessWidget {
  const RadioInput({
    Key? key,
    required this.options,
    required this.title,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  final List<RadioOption> options;

  final String title;

  final dynamic initialValue;

  final void Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext _context) => radioInput(
        options: options,
        title: title,
        initialValue: initialValue,
        onChanged: onChanged,
      );
}
