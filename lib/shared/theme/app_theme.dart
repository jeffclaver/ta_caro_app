import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static final AppTheme instance = AppTheme();

  final _colors = AppColors();
  static AppColors get colors => instance._colors;

  final _textStyles = AppTextStyles();
  static AppTextStyles get textStyle => instance._textStyles;
}
