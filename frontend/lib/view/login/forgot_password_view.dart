import 'package:flutter/material.dart';
import 'package:test1/common/color_extension.dart';
import 'package:test1/commonwidget/round_button.dart';
import 'package:test1/commonwidget/round_textfield.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController txtEmail = TextEditingController();

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
                "Forgot Password",
                style: TextStyle(
                    color: TColor.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextField(
                controller: txtEmail,
                hintText: "Email Address",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundLineButton(
                title: "Submit",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
