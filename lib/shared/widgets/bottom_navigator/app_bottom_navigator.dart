import 'package:flutter/material.dart';
import '/shared/theme/app_theme.dart';

class AppBottomNavigator extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;
  const AppBottomNavigator({
    Key? key,
    required this.currentIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 26, right: 26, bottom: 14),
      child: Container(
        decoration: BoxDecoration(
            color: AppTheme.colors.textEnabled,
            borderRadius: BorderRadius.circular(12)),
        height: 76,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconBottomNavigator(
              icon: Icons.home,
              onTap: () {
                onChanged(0);
              },
              enabled: currentIndex == 0,
            ),
            IconBottomNavigator(
              icon: Icons.add,
              onTap: () {
                onChanged(3);
              },
              enabled: false,
            ),
            IconBottomNavigator(
              icon: Icons.settings,
              onTap: () {
                onChanged(1);
              },
              enabled: currentIndex == 1,
            ),
          ],
        ),
      ),
    );
  }
}

class IconBottomNavigator extends StatelessWidget {
  final Function() onTap;
  final bool enabled;
  final IconData icon;
  const IconBottomNavigator({
    Key? key,
    required this.onTap,
    required this.enabled,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        child: Icon(
          icon,
          color: enabled
              ? AppTheme.colors.textEnabled
              : AppTheme.colors.textDisabled,
        ),
        decoration: BoxDecoration(
            color:
                enabled ? AppTheme.colors.primary : AppTheme.colors.background,
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
