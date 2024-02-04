import 'package:flutter/material.dart';

import 'package:test1/common/color_extension.dart';
import 'package:test1/view/onboarding/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const OnboardingView(),
    );
  }
}
