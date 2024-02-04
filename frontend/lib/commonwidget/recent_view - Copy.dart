// ignore: file_names
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class RecentView extends StatelessWidget {
  final Map iObj;
  //final Map bObj;
  const RecentView({super.key, required this.iObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0, 2),
                        blurRadius: 5)
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  iObj["img"].toString(),
                  width: media.width * 0.32,
                  height: media.width * 0.6,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              iObj["name"].toString(),
              maxLines: 3,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: TColor.text,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              iObj["author"].toString(),
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: TColor.subTitle,
                fontSize: 13,
              ),
            ),
          ],
        ));
  }
}
