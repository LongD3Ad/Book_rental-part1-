import 'package:flutter/material.dart';
import 'package:test1/common/color_extension.dart';
import 'package:test1/commonwidget/round_button.dart';
import 'package:test1/commonwidget/round_textfield.dart';
import 'package:test1/view/login/helpus_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobilePhone = TextEditingController();
  TextEditingController txtCode = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
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
                "Sign Up",
                style: TextStyle(
                    color: TColor.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              RoundTextField(
                controller: txtFirstName,
                hintText: "First & Last Name",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtEmail,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtMobilePhone,
                hintText: "Mobile Phone",
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtCode,
                hintText: "Group Special Code (optional)",
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
                    "Please Sign me Up for Monthly Updates",
                    style: TextStyle(
                      color: TColor.subTitle.withOpacity(0.3),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              RoundLineButton(
                title: "Sign Up",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HelpUsView()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
