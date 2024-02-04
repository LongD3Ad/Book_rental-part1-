import 'package:flutter/material.dart';
import 'package:test1/common/color_extension.dart';

class OurBooksView extends StatefulWidget {
  const OurBooksView({super.key});

  @override
  State<OurBooksView> createState() => _OurBooksViewState();
}

class _OurBooksViewState extends State<OurBooksView> {
  List imageArr = [
    "assets/img/ob1.png",
    "assets/img/ob2.png",
    "assets/img/ob3.png"
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  "assets/img/our_books_top.png",
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: media.width * 0.9,
                  alignment: Alignment.bottomLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: imageArr.map((iName) {
                        var isFirst = imageArr.first == iName;
                        var isLast = imageArr.last == iName;
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: isFirst
                              ? const EdgeInsets.only(left: 15)
                              : (isLast
                                  ? const EdgeInsets.only(right: 15)
                                  : null),
                          child: Image.asset(
                            iName,
                            height: 120,
                            fit: BoxFit.fitHeight,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Text(
                """BookRentals, launched in February 2024 as a mini project by two students, offers a curated selection of discounted, gently-used books for rent, aiming to make reading affordable and accessible for all.
                 With a user-friendly app and focus on sustainability, BookRentals aspires to become a vibrant community of bibliophiles and expand its reach through partnerships, format diversification, and a reward system, all while staying true to its roots as a testament to the power of dreams.
                 The Future Unfolds:

                  As we move forward, BookRentals aspires to, Partner with schools and libraries to promote reading programs and encourage literacy amongst all age groups.
                  Expand our selection to include audiobooks and e-books, catering to diverse reading preferences.
                  Implement a reward system to incentivize regular rentals and foster a loyal book-loving community.
                  Join us on this exciting journey as we turn the page on traditional book ownership and unlock a world of affordable reading possibilities!
            
            We also love reading and recommending books to others and we are proud of the role we play in demonstrating to our customers how good and fun books can be.""",
                textAlign: TextAlign.justify,
                style: TextStyle(color: TColor.subTitle, fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
