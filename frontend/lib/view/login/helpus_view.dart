import 'package:flutter/material.dart';
import 'package:test1/common/color_extension.dart';
import 'package:test1/view/maintab/maintab_view.dart';

import '../../commonwidget/round_button.dart';

class HelpUsView extends StatefulWidget {
  const HelpUsView({super.key});

  @override
  State<HelpUsView> createState() => _HelpUsViewState();
}

class _HelpUsViewState extends State<HelpUsView> {
 List<String> cities = ['Mangaluru','Hubli','Udupi','Kankanadi'];
  List<String> states= ['Karnataka','Andra pradesh','Kerala'];
  String state='';
  String city='';

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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Help Us Help You",
                style: TextStyle(
                    color: TColor.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "It seems as this is your first time using our app, please enter your location so we can filter our results and stock accordingly to your local store",
                style: TextStyle(
                  color: TColor.subTitle,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "If you choose to skip, you can change your location at any time in your account settings",
                style: TextStyle(
                  color: TColor.subTitle,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: TColor.textbox,
                      borderRadius: BorderRadius.circular(20)),
                  child: DropdownButton(
                    isExpanded: true,
                    hint: Text(state.isEmpty? "State":state),
                    underline: Container(),
                    items: states.map((name) {
                      return DropdownMenuItem(
                        value: name,
                        child: Text(name),
                      );
                    }).toList(),
                    onChanged: (selectVal) {
                      setState(() {
                      state = selectVal!;
                      });
                    },
                  )),
              const SizedBox(
                height: 15,
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: TColor.textbox,
                      borderRadius: BorderRadius.circular(20)),
                  child: DropdownButton(
                    isExpanded: true,
                    hint: Text(city.isEmpty?'City':city),
                    underline: Container(),
                    items: cities.map((name) {
                      return DropdownMenuItem(
                        value: name,
                        child: Text(name),
                      );
                    }).toList(),
                    onChanged: (selectVal) {
                      setState(() {
                      city = selectVal!;
                      });
                    },
                  )),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainTabView()));
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: TColor.primary),
                    ),
                  ),
                ],
              ),
               RoundLineButton(
                title: "Continue",
                onPressed: () {
                
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}
