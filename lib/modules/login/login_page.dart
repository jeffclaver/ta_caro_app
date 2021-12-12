import 'package:flutter/material.dart';
import '/shared/widgets/button/button.dart';

import '/shared/theme/app_theme.dart';
import '/shared/widgets/input_text/input_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Image.asset("assets/images/logo.png", width: 200),
              InputText(text: "Email", hintText: "Digite seu email"),
              SizedBox(height: 18),
              InputText(text: "Senha", hintText: "Digite sua senha"),
              SizedBox(height: 15),
              Button(text: "Entrar", type: ButtonType.fill),
              SizedBox(height: 50),
              Button(text: "Criar Conta", type: ButtonType.outline)
            ],
          ),
        ),
      ),
    );
  }
}
