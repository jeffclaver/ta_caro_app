import 'package:flutter/material.dart';
import 'package:tacaroapp/modules/feed/feed_page.dart';
import 'package:tacaroapp/modules/home/home_page.dart';
import 'package:tacaroapp/modules/login/login_page.dart';
import 'package:tacaroapp/modules/login/pages/create_account_page.dart';
import 'package:tacaroapp/modules/profile/profile_page.dart';
import 'package:tacaroapp/modules/splash/splash_page.dart';
import 'package:tacaroapp/shared/models/user_model.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Race #1",
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashPage(),
        "/login": (context) => const LoginPage(),
        "/login/create-account": (context) => const CreateAccountPage(),
        "/home": (context) => HomePage(
              pages: [FeedPage(), ProfilePage()],
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
      },
    );
  }
}
