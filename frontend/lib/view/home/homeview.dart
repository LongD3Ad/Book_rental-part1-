import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test1/common/color_extension.dart';
import 'package:test1/commonwidget/best_picks_view%20-%20Copy.dart';
import 'package:test1/commonwidget/genre_view%20-%20Copy%20-%20Copy.dart';
import 'package:test1/commonwidget/recent_view%20-%20Copy.dart';
import 'package:test1/commonwidget/round_button.dart';
import 'package:test1/commonwidget/round_textfield.dart';
import 'package:test1/commonwidget/top_picks_view.dart';
import 'package:test1/view/login/signup_view.dart';
import 'package:test1/view/maintab/maintab_view.dart';

import '../book_reading/book_reading_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmailAddress = TextEditingController();
  List topPickArr = [
    {
      "name": "The Dissapearance of Emila Zola",
      "author": "Michael Rosen",
      "img": "assets/img/1.jpg"
    },
    {
      "name": "Fatherhood",
      "author": "Marcus Berkmann",
      "img": "assets/img/2.jpg"
    },
    {
      "name": "The Time Travellers Handbook",
      "author": "Stride Lottie",
      "img": "assets/img/3.jpg"
    }
  ];

  List bestArr = [
    {
      "name": "Fatherhood",
      "author": "by Christopher Wilson",
      "img": "assets/img/4.jpg",
      "rating": 5.0
    },
    {
      "name": "Tattletale",
      "author": "by Sarah J. Noughton",
      "img": "assets/img/5.jpg",
      "rating": 4.0
    },
    {
      "name": "In A Land Of Paper Gods",
      "author": "by Rebecca Mackenzie",
      "img": "assets/img/6.jpg",
      "rating": 5.0
    }
  ];

  List genreArr = [
    {
      "name": "Graphic Novels",
      "img": "assets/img/Gr1.png",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/img/Gr1.png",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/img/Gr1.png",
    }
  ];

  List recentArr = [
    {
      "name": "The Fatal Tree",
      "author": "by Jake Arnott",
      "img": "assets/img/rec1.jpg"
    },
    {
      "name": "Day Four",
      "author": "by LOTZ, SARAH",
      "img": "assets/img/rec2.jpg"
    },
    {
      "name": "Door to Door",
      "author": "by Edward Humes",
      "img": "assets/img/rec3.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  child: Transform.scale(
                    scale: 1.5,
                    origin: Offset(0, media.width * 0.8),
                    child: Container(
                      width: media.width,
                      height: media.width,
                      decoration: BoxDecoration(
                          color: TColor.primary,
                          borderRadius:
                              BorderRadius.circular(media.width * 0.5)),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: const Row(children: [
                        Text(
                          "Our Top Picks",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                      leading: Container(),
                      leadingWidth: 1,
                      actions: [
                        IconButton(
                          onPressed: () {
                            sideMenuScaffoldkey.currentState?.openEndDrawer();
                          },
                          icon: const Icon(Icons.menu),
                          color: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.8,
                      child: CarouselSlider.builder(
                        itemCount: topPickArr.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          var iObj = topPickArr[itemIndex] as Map? ?? {};
                          return TopPicksView(
                            iObj: iObj,
                          );
                        },
                        options: CarouselOptions(
                          aspectRatio: 0.7, //can cause render yellow error
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 0.4,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text(
                          "Bestsellers",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: media.width * 0.9,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: bestArr.length,
                          itemBuilder: (context, index) {
                            var bObj = bestArr[index] as Map? ?? {};

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BookReadingView(
                                              bObj: bObj,
                                            )));
                              },
                              child: BestPicksView(
                                bObj: bObj,
                              ),
                            );
                          }),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text(
                          "Genres",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: media.width * 0.7,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: genreArr.length,
                          itemBuilder: (context, index) {
                            var bObj = genreArr[index] as Map? ?? {};

                            return GenreView(
                              bObj: bObj,
                              bgcolor: index % 2 == 0
                                  ? TColor.color1
                                  : TColor.color2,
                            );
                          }),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text(
                          "Recently Viewed",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: media.width,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: recentArr.length,
                          itemBuilder: (context, index) {
                            var iObj = recentArr[index] as Map? ?? {};

                            return RecentView(
                              iObj: iObj,
                            );
                          }),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text(
                          "Monthly Newsletter",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                          color: TColor.textbox.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Receive our monthly newsletter and receive updates on new stock, books and the occasional promotion.",
                              style: TextStyle(
                                color: TColor.subTitle,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            RoundTextField(
                              controller: txtName,
                              hintText: "Name",
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            RoundTextField(
                              controller: txtEmailAddress,
                              hintText: "Email Address",
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MinRoundLineButton(
                                  title: "Sign Up",
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUpView()));
                                  },
                                )
                              ],
                            )
                          ]),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
