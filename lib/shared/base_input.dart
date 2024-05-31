import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tailwind_standards/tailwind_standards.dart';

class BaseInput extends StatelessWidget {
  final String title;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final String? error;
  final String? prefix;
  final String? suffix;
  final void Function(String)? onChanged;

  const BaseInput({
    super.key,
    required this.title,
    required this.keyboardType,
    this.inputFormatters,
    this.initialValue,
    this.error,
    this.prefix,
    this.suffix,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
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
            prefixIcon: prefix != null
                ? Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    alignment: Alignment.center,
                    child: TText(
                      prefix!,
                      props: 'text-gray-500 text-sm',
                    ),
                  )
                : null,
            suffixIcon: suffix != null
                ? Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    alignment: Alignment.center,
                    child: TText(
                      suffix!,
                      props: 'text-gray-500 text-sm',
                    ),
                  )
                : null,
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
                    error!,
                    props: 'text-red-600 text-s',
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
          ),
          style: TextStyle(color: TColor.gray900),
        ),
      ],
    );
  }
}
