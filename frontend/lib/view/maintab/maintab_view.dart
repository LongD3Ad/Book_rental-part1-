import 'package:flutter/material.dart';
import 'package:test1/common/color_extension.dart';
import 'package:test1/view/home/homeview.dart';
import 'package:test1/view/search/search_view.dart';

import '../account/account_view.dart';
import '../ourbooks/our_books_view.dart';

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

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
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
                                    mObj["icon"] as IconData? ?? Icons.home,
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
    );
  }
}
