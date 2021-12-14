import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/shared/theme/app_text.dart';
import '/shared/theme/app_theme.dart';

class InputText extends StatelessWidget {
  final String text;
  final String hintText;
  final bool obscure;
  final void Function(String)? onChanged;
  final String? Function(String)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  const InputText({
    required this.text,
    required this.hintText,
    this.onChanged,
    this.validator,
    Key? key,
    this.obscure = false,
    this.inputFormatters,
    this.textInputType,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text).label,
        SizedBox(height: 12),
        TextFormField(
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          obscureText: obscure,
          onChanged: onChanged,
          validator: (value) {
            if (validator != null) {
              return validator!(value ?? "");
            }
          },
          style: AppTheme.textStyle.input,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTheme.textStyle.hint,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppTheme.colors.border))),
        ),
      ],
    );
  }
}
