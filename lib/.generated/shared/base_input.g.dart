// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../shared/base_input.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class BaseInput extends StatelessWidget {
  const BaseInput({
    Key? key,
    required this.title,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.initialValue,
    this.error,
    this.prefix,
    this.suffix,
    this.onChanged,
  }) : super(key: key);

  final String title;

  final TextInputType? keyboardType;

  final List<TextInputFormatter>? inputFormatters;

  final String? initialValue;

  final String? error;

  final String? prefix;

  final String? suffix;

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext _context) => baseInput(
        title: title,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        initialValue: initialValue,
        error: error,
        prefix: prefix,
        suffix: suffix,
        onChanged: onChanged,
      );
}
