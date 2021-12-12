import 'package:flutter/material.dart';
import 'package:tacaroapp/shared/theme/app_theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((val) {
      Navigator.pushReplacementNamed(context, "/login");
    });
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Image.asset("assets/images/logo.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 35.0),
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
