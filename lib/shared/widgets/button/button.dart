import 'package:flutter/material.dart';
import '/shared/theme/app_theme.dart';

enum ButtonType { fill, outline, none }

class Button extends StatelessWidget {
  final String text;
  final ButtonType type;
  final Function() onPressed;
  const Button({
    Key? key,
    required this.text,
    required this.type,
    required this.onPressed,
  }) : super(key: key);

  BoxDecoration get boxDecoration {
    switch (type) {
      case ButtonType.fill:
        return BoxDecoration(
            color: AppTheme.colors.primary,
            borderRadius: BorderRadius.circular(10));
      case ButtonType.outline:
        return BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(
                BorderSide(color: AppTheme.colors.border, width: 1.5)));
      case ButtonType.none:
        return BoxDecoration(color: Colors.transparent);
      default:
        throw "Invalid Button";
    }
  }

  TextStyle get textStyle {
    switch (type) {
      case ButtonType.fill:
        return AppTheme.textStyle.buttonBackgroundColor;
      case ButtonType.outline:
        return AppTheme.textStyle.buttonBoldTextColor;
      case ButtonType.none:
        return AppTheme.textStyle.buttonTextColor;
      default:
        throw "INVALID BUTTON TYPE";
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      child: Container(
        child: Center(child: Text(text, style: textStyle)),
        width: size.width,
        height: 58,
        decoration: boxDecoration,
      ),
      onTap: onPressed,
    );
  }
}
