import 'package:flutter/material.dart';
import 'package:tacaroapp/modules/login/pages/create_account_controller.dart';
import 'package:tacaroapp/modules/login/repositories/login_repository_impl.dart';
import 'package:tacaroapp/shared/services/app_database.dart';
import 'package:tacaroapp/shared/widgets/button/button.dart';
import 'package:tacaroapp/shared/widgets/input_text/input_text.dart';
import 'package:validators/validators.dart';
import '/shared/theme/app_theme.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  late final CreateAccountController controller;

  @override
  void initState() {
    super.initState();
    controller = CreateAccountController(
        repository: LoginRepositoryImpl(dataBase: AppDataBase.instance));
    controller.addListener(() {
      controller.state.when(
          success: (value) => Navigator.pop(context),
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
      appBar: AppBar(
        backgroundColor: AppTheme.colors.background,
        elevation: 0,
        leading: BackButton(color: AppTheme.colors.backButton),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Criando uma conta", style: AppTheme.textStyle.title),
                  SizedBox(height: 10),
                  Text("Mantenha seus gastos em dia",
                      style: AppTheme.textStyle.subtitle),
                  SizedBox(height: 38),
                  InputText(
                    text: "Nome",
                    hintText: "Digite seu nome completo",
                    textInputAction: TextInputAction.next,
                    validator: (value) =>
                        isAlpha(value) ? null : "Digite um nome válido",
                    onChanged: (value) => controller.onChanged(name: value),
                  ),
                  SizedBox(height: 18),
                  InputText(
                      text: "Email",
                      hintText: "Digite seu email",
                      textInputAction: TextInputAction.next,
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
                            loading: () =>
                                Center(child: CircularProgressIndicator()),
                            orElse: () => Button(
                              text: "Criar conta",
                              type: ButtonType.fill,
                              onPressed: () {
                                controller.create();
                              },
                            ),
                          ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
