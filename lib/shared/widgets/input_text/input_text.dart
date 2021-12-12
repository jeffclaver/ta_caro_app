import 'package:flutter/material.dart';
import '/shared/theme/app_text.dart';
import '/shared/theme/app_theme.dart';

class InputText extends StatelessWidget {
  final String text;
  final String hintText;

  const InputText({
    required this.text,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text).label,
        SizedBox(height: 12),
        TextFormField(
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
