import 'package:flutter/material.dart';
import 'package:tacaroapp/shared/models/user_model.dart';
import 'package:tacaroapp/shared/widgets/card_product/card_product.dart';
import '/shared/widgets/list_tile/app_list_tile.dart';
import '/shared/theme/app_theme.dart';
import '/shared/widgets/bottom_navigator/app_bottom_navigator.dart';

class HomePage extends StatefulWidget {
  // final UserModel user;
  const HomePage({
    Key? key,
    // required this.user,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Stack(children: [
        Column(
          children: [
            SizedBox(
                height: 126,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CardProdut(),
                )),
            AppListTile(),
            AppListTile(),
            AppListTile(),
            AppListTile(),
          ],
        ),
        Positioned(
          bottom: 14,
          right: 26,
          left: 26,
          child: AppBottomNavigator(
            currentIndex: currentIndex,
            onChanged: changeIndex,
          ),
        ),
      ]),
    );
  }
}
