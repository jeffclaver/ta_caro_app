import 'package:flutter/material.dart';
import 'package:tacaroapp/shared/theme/app_theme.dart';

class CardProdut extends StatelessWidget {
  const CardProdut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
            color: AppTheme.colors.textEnabled,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                  backgroundColor: AppTheme.colors.background,
                  radius: 30,
                  child: Icon(Icons.camera_alt_outlined)),
              title: Text("Produto"),
              subtitle: Text("Preço"),
            ),
            Text.rich(TextSpan(
                text: "Agora\n", children: [TextSpan(text: "R\$ 65,50")]))
          ],
        ),
      ),
    );
  }
}
