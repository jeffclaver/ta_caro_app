import 'package:flutter/material.dart';
import 'package:tacaroapp/modules/login/login_controller.dart';
import 'package:validators/validators.dart';
import '/shared/widgets/button/button.dart';

import '/shared/theme/app_theme.dart';
import '/shared/widgets/input_text/input_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      controller.state.when(
          success: (value) => Navigator.pushReplacementNamed(context, "/home"),
          error: (message, _) {
            final snackBar = SnackBar(
              content: Text(message),
              backgroundColor: Colors.redAccent,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          orElse: () {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Image.asset("assets/images/logo.png", width: 200),
                InputText(
                    text: "Email",
                    hintText: "Digite seu email",
                    validator: (value) =>
                        isEmail(value) ? null : "Digite um email válido",
                    onChanged: (value) => controller.onChanged(email: value)),
                SizedBox(height: 18),
                InputText(
                    text: "Senha",
                    hintText: "Digite sua senha",
                    obscure: true,
                    validator: (value) => value.length >= 6
                        ? null
                        : "Digite uma senha igual 6 ou mais caracteres",
                    onChanged: (value) =>
                        controller.onChanged(password: value)),
                SizedBox(height: 15),
                AnimatedBuilder(
                    animation: controller,
                    builder: (_, __) => controller.state.when(
                          loading: () => CircularProgressIndicator(),
                          orElse: () => Column(
                            children: [
                              Button(
                                text: "Entrar",
                                type: ButtonType.fill,
                                onPressed: () {
                                  controller.login();
                                },
                              ),
                              SizedBox(height: 50),
                              Button(
                                  text: "Criar Conta",
                                  type: ButtonType.outline,
                                  onPressed: () => Navigator.pushNamed(
                                      context, "/login/create-account")),
                            ],
                          ),
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}