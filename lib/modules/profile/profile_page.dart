import 'package:flutter/material.dart';
import 'package:tacaroapp/shared/theme/app_theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Perfil",
                style: AppTheme.textStyle.title.copyWith(fontSize: 36)),
            SizedBox(height: 100),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppTheme.colors.textEnabled),
              child: ListTile(
                title: Text(
                  "Sair do aplicativo",
                  style: AppTheme.textStyle.titleListTile,
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/login");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
