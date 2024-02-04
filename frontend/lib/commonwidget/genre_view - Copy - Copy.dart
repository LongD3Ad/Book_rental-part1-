// ignore: file_names
import 'package:flutter/material.dart';

class GenreView extends StatelessWidget {
  final Map bObj;
  final Color bgcolor;
  const GenreView({super.key, required this.bObj, required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: bgcolor, borderRadius: BorderRadius.circular(15)),
        width: media.width * 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              bObj["img"].toString(),
              width: media.width * 0.7,
              height: media.width * 0.35,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              bObj["name"].toString(),
              maxLines: 3,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ));
  }
}
