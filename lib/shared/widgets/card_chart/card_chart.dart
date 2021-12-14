import 'package:flutter/material.dart';
import 'package:tacaroapp/shared/theme/app_text.dart';
import 'package:tacaroapp/shared/theme/app_theme.dart';
import 'package:tacaroapp/shared/widgets/chart_horizontal/chart_horizontal.dart';

class CardChart extends StatelessWidget {
  final double value;
  final double percent;
  const CardChart({Key? key, required this.value, required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 216,
        decoration: BoxDecoration(
            color: AppTheme.colors.textEnabled,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Gasto mensal").label,
            SizedBox(height: 18),
            Text.rich(TextSpan(
                text: "R\$ ",
                style: AppTheme.textStyle.label,
                children: [
                  TextSpan(
                    text: value.toStringAsFixed(2).replaceAll(".", ","),
                    style: AppTheme.textStyle.title.copyWith(fontSize: 36),
                  )
                ])),
            SizedBox(height: 10),
            ChartHorizontal(
              percent: percent,
            )
          ]),
        ));
  }
}
