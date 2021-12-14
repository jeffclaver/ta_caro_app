import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tacaroapp/shared/models/produt_model.dart';
import 'package:tacaroapp/shared/theme/app_theme.dart';

class CardProdut extends StatelessWidget {
  final ProductModel product;
  const CardProdut({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
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
                  child: product.currentPrice < product.lastPrice
                      ? Icon(
                          FontAwesomeIcons.thumbsUp,
                          color: AppTheme.colors.primary,
                        )
                      : Icon(
                          FontAwesomeIcons.thumbsDown,
                          color: AppTheme.colors.badColor,
                        )),
              title: Text(
                product.name,
                style: AppTheme.textStyle.titleListTile,
              ),
              subtitle: Text(
                "Estava R\$ ${product.lastPrice}",
                style: AppTheme.textStyle.subtitleListTile,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text.rich(
                  TextSpan(
                      text: "Agora\n",
                      style: AppTheme.textStyle.subtitleListTile,
                      children: [
                        TextSpan(
                            text: "R\$ ${product.currentPrice}",
                            style: AppTheme.textStyle.title),
                      ]),
                )),
          ],
        ),
      ),
    );
  }
}
