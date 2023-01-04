import 'package:flutter/material.dart';

// TextFormFieldコンポーネント
class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int maxLines;
  final int? maxLength;
  final dynamic onChanged;
  final dynamic validator;
  final dynamic keyboardType;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.maxLines = 1,
    this.maxLength,
    required this.onChanged,
    required this.validator,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        autofocus: true,
        controller: controller,
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
