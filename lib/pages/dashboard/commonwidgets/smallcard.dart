import 'package:flutter/material.dart';
import 'package:nmtchat/pages/dashboard/constants/widgetcolors.dart';

class ccard extends StatelessWidget {
  const ccard({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.subtitle,
    required this.isExpense,
    required this.isdark,
  });

  final double height;
  final double width;
  final String title;
  final String subtitle;
  final bool isExpense;
  final bool isdark;

  @override
  Widget build(BuildContext context) {
    var green = Colors.green;
    var red = Colors.red;

    return Container(
      padding: const EdgeInsets.all(5.0),
      height: 0.2 * height,
      width: width * 0.5,
      child: Card(
        color: isdark ? const Color.fromARGB(255, 16, 14, 14) : tcards,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    CircleAvatar(
                      backgroundColor: isExpense
                          ? const Color.fromARGB(255, 125, 84, 81)
                          : Color.fromARGB(255, 82, 109, 83),
                      child: isExpense
                          ? Icon(
                              Icons.arrow_upward,
                              color: red,
                            )
                          : Icon(
                              Icons.arrow_downward,
                              color: green,
                            ),
                    ),
                  ]),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
