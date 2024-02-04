import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:test1/common/color_extension.dart';
import 'package:test1/commonwidget/round_button.dart';
import 'package:test1/commonwidget/round_textfield.dart';
import 'package:test1/view/login/forgot_password_view.dart';

// backend
import 'package:http/http.dart' as http;

import '../maintab/maintab_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController txtCode = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isStay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: TColor.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign In",
                style: TextStyle(
                    color: TColor.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtCode,
                hintText: "Optional Group Special Code",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtEmail,
                hintText: "Email Address",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtPassword,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isStay = !isStay;
                      });
                    },
                    icon: Icon(
                      isStay ? Icons.check_box : Icons.check_box_outline_blank,
                      color: isStay
                          ? TColor.primary
                          : TColor.subTitle.withOpacity(0.3),
                    ),
                  ),
                  Text(
                    "Stay Logged In",
                    style: TextStyle(
                      color: TColor.subTitle.withOpacity(0.3),
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordView()));
                    },
                    child: Text(
                      "Forgot Your Password?",
                      style: TextStyle(
                        color: TColor.subTitle.withOpacity(0.3),
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              RoundLineButton(
                title: "Sign In",
                onPressed: () async {
                  // backend integration
                  try {
                    var response = await http.post(
                        Uri.parse('http://10.0.2.2:8000/api/token/'),
                        body: {
                          "email": txtEmail.text,
                          "password": txtPassword.text
                        });
                    // print(jsonDecode(response.body)['access']);

// save token in local storage //shared preferences
                    if (response.statusCode == 200) {
                      final SharedPreferences prefs = await _prefs;
                      prefs.setString(
                          'access_token', jsonDecode(response.body)['access']);
                      prefs.setString('refresh_token',
                          jsonDecode(response.body)['refresh']);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainTabView()));
                    } else {ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Invalid Credentials'),
        duration: Duration(seconds: 2), // Adjust the duration as needed
      ),
    );}
                  } catch (e) {
                    print(e.toString());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
