import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/common/color_extension.dart';
import 'package:test1/view/onboarding/onboarding_view.dart';

import 'view/maintab/maintab_view.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    loginFlag: prefs.getKeys().contains('access_token'),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.loginFlag});
  final bool loginFlag;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: TColor.primary,
        useMaterial3: true,
        fontFamily: 'SF Pro Text',
      ),
      home: loginFlag ? const MainTabView() : const OnboardingView(),
    );
  }
}
