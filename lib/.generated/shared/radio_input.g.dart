// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../shared/radio_input.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class RadioInput extends StatelessWidget {
  const RadioInput({
    Key? key,
    required this.options,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  final List<RadioOption> options;

  final dynamic initialValue;

  final void Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext _context) => radioInput(
        options: options,
        initialValue: initialValue,
        onChanged: onChanged,
      );
}
