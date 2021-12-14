import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import '/modules/create/create_controller.dart';
import '/modules/create/repositories/create_repository_impl.dart';
import '/shared/services/app_database.dart';
import '/shared/widgets/button/button.dart';
import '/shared/widgets/input_text/input_text.dart';

class CreateBottomSheet extends StatefulWidget {
  const CreateBottomSheet({Key? key}) : super(key: key);

  @override
  State<CreateBottomSheet> createState() => _CreateBottomSheetState();
}

class _CreateBottomSheetState extends State<CreateBottomSheet> {
  late final CreateController controller;

  @override
  void initState() {
    super.initState();
    controller = CreateController(
        repository: CreateRepositoryImpl(database: AppDataBase.instance));
    controller.addListener(() {
      controller.state
          .when(success: (_) => Navigator.pop(context), orElse: () {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 42, vertical: 16),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              SizedBox(height: 32),
              InputText(
                text: "Produto",
                hintText: "Digite um nome",
                textInputAction: TextInputAction.next,
                onChanged: (value) => controller.onChanged(name: value),
                validator: (value) =>
                    value.isNotEmpty ? null : "Digite o nome do produto",
              ),
              SizedBox(height: 8),
              InputText(
                text: "Preço",
                hintText: "Digite o valor",
                textInputAction: TextInputAction.next,
                onChanged: (value) => controller.onChanged(price: value),
                textInputType: TextInputType.number,
                validator: (value) =>
                    value.isNotEmpty ? null : "Digite o valor do produto",
                inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
              ),
              SizedBox(height: 8),
              InputText(
                text: "Data da compra",
                hintText: "Digite dd/mm/aa",
                textInputType: TextInputType.datetime,
                onChanged: (value) => controller.onChanged(date: value),
                validator: (value) => value.length == 10
                    ? null
                    : "Digite a data da compra do produto",
                inputFormatters: [MaskedInputFormatter("00/00/0000")],
              ),
              SizedBox(height: 8),
              SizedBox(height: 20),
              AnimatedBuilder(
                  animation: controller,
                  builder: (_, __) => controller.state.when(
                        loading: () => Center(
                          child: CircularProgressIndicator(),
                        ),
                        error: (message, _) => Text(message),
                        orElse: () => Button(
                            text: "Adicionar",
                            onPressed: () {
                              controller.create();
                            },
                            type: ButtonType.fill),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
