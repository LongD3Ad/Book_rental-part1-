import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test1/common/color_extension.dart';
import 'package:test1/view/home/homeview.dart';
import 'package:test1/view/onboarding/onboarding_view.dart';
import 'package:test1/view/search/search_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../account/account_view.dart';
import '../ourbooks/our_books_view.dart';
import 'package:http/http.dart' as http;

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

GlobalKey<ScaffoldState> sideMenuScaffoldkey = GlobalKey<ScaffoldState>();

class _MainTabViewState extends State<MainTabView>
    with TickerProviderStateMixin {
  TabController? controller;

  int selectMenu = 0;
  bool _isMounted = false;
  List menuArr = [
    {"name": "Home", "icon": Icons.home},
    {"name": "Our Books", "icon": Icons.book},
    {"name": "Our Stores", "icon": Icons.shop},
    {"name": "Careers", "icon": Icons.business_center},
    {"name": "Sell With Us", "icon": Icons.attach_money},
    {"name": "Newsletter", "icon": Icons.newspaper},
    {"name": "Pop-Up Leasing", "icon": Icons.open_in_new},
    {"name": "Account", "icon": Icons.account_circle},
  ];
  Future<void> getHompageData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse('http://10.0.2.2:8000/api/'),
        headers: {
          'Authorization': 'Bearer ${prefs.getString('access_token')}'
        });
    if (response.statusCode == 200) {
      prefs.setString('data', response.body);
      print(response.body);
      setState(() {
        _isMounted = true;
      });
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnboardingView()));
    }
  }

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    // TODO: implement initState
    getHompageData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return _isMounted
        ? Scaffold(
            key: sideMenuScaffoldkey,
            endDrawer: Drawer(
                backgroundColor: Colors.transparent,
                elevation: 0,
                width: media.width * 0.7,
                surfaceTintColor: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        color: TColor.color3,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(media.width * 0.7),
                        ),
                        boxShadow: const [
                          BoxShadow(color: Colors.black54, blurRadius: 15)
                        ]),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 80,
                          ),
                          Column(
                              mainAxisSize: MainAxisSize.min,
                              children: menuArr.map((mObj) {
                                var index = menuArr.indexOf(mObj);
                                return Container(
                                  //margin: const EdgeInsets.symmetric(
                                  // vertical: 4, horizontal: 15),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 15),
                                  decoration: selectMenu == index
                                      ? BoxDecoration(
                                          color: TColor.primary,
                                          boxShadow: [
                                              BoxShadow(
                                                  color: TColor.primary,
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 3))
                                            ])
                                      : null,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectMenu = index;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          mObj["name"].toString(),
                                          style: TextStyle(
                                              color: selectMenu == index
                                                  ? Colors.white
                                                  : TColor.text,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Icon(
                                          mObj["icon"] as IconData? ??
                                              Icons.home,
                                          color: selectMenu == index
                                              ? Colors.white
                                              : TColor.primary,
                                          size: 30,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }).toList()),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.settings,
                                      color: TColor.subTitle,
                                      size: 25,
                                    )),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Terms",
                                    style: TextStyle(
                                        color: TColor.subTitle,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Privacy",
                                    style: TextStyle(
                                        color: TColor.subTitle,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))),
            body: TabBarView(controller: controller, children: const [
              HomeView(),
              SearchView(),
              OurBooksView(),
              AccountView(),
            ]),
            bottomNavigationBar: BottomAppBar(
              color: TColor.primary,
              child: TabBar(
                  controller: controller,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white54,
                  tabs: const [
                    Tab(
                      icon: Icon(Icons.home),
                      text: "Home",
                    ),
                    Tab(
                      icon: Icon(Icons.search),
                      text: "Search",
                    ),
                    Tab(
                      icon: Icon(Icons.menu),
                      text: "WishList",
                    ),
                    Tab(
                      icon: Icon(Icons.shopping_bag),
                      text: "Cart",
                    ),
                  ]),
            ),
          )
        : Container(
            color: Colors.white,
            child: const Center(child: CircularProgressIndicator()));
  }
}


// {"books":[{"id":1,"name":"BOSSE","image":"/media/books/input_fNZJjch.png","description":"1111","content":"111","categories":"comedy,tragedy","author":1,"store":1}]}