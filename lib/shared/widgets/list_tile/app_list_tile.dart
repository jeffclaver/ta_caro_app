import 'package:flutter/material.dart';

import 'package:tacaroapp/shared/models/order_model.dart';
import 'package:tacaroapp/shared/theme/app_theme.dart';

class AppListTile extends StatelessWidget {
  final OrderModel order;
  const AppListTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
            color: AppTheme.colors.textEnabled,
            borderRadius: BorderRadius.circular(12)),
        child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppTheme.colors.background,
              radius: 30,
              child: Text(
                order.created.split("-").sublist(1).reversed.join("/"),
                style: AppTheme.textStyle.label,
              ),
            ),
            title: Text(
              order.name,
              style: AppTheme.textStyle.titleListTile,
            ),
            subtitle: Text(
              "R\$ ${order.price.toStringAsFixed(2)}",
              style: AppTheme.textStyle.subtitleListTile,
            ),
            trailing: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("Editar"),
                ),
                PopupMenuItem(
                  child: Text("Excluir"),
                )
              ],
            )),
      ),
    );
  }
}
