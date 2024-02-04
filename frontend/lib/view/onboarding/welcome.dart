import 'package:flutter/material.dart';
import 'package:test1/common/color_extension.dart';
import 'package:test1/commonwidget/round_button.dart';
import 'package:test1/view/login/signin_view.dart';
import 'package:test1/view/login/signup_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/img/Onboarding.4.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: Container(
            width: media.width,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(
                  height: media.width * 0.25,
                ),
                Text(
                  "Books For\nEvery Taste.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: TColor.primary,
                      fontSize: 35,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: media.width * 0.25,
                ),
                RoundButton(
                  title: "Sign in",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInView()));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundButton(
                  title: "Sign up",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpView()));
                  },
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
