import 'package:flutter/material.dart';
import 'package:nmtchat/pages/dashboard/constants/widgetcolors.dart';

class Balance_card extends StatelessWidget {
  const Balance_card({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.subtitle,
    required this.isdark,
  });

  final double height;
  final double width;
  final String title;
  final String subtitle;
  final bool isdark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 0.15 * height,
      width: width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
        BoxShadow(
            color: Colors.white,
            offset: Offset(-3, -3),
            blurRadius: 10,
            spreadRadius: 3),
        BoxShadow(
            color: Colors.black,
            offset: Offset(3, 3),
            blurRadius: 10,
            spreadRadius: 3),
      ]),
      child: Card(
        color: isdark ? Color.fromARGB(255, 16, 14, 14) : tcards,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 15,
            ),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        )),
      ),
    );
  }
}
