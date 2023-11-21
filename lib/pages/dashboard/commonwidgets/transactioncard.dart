import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nmtchat/pages/dashboard/constants/widgetcolors.dart';

import 'package:nmtchat/pages/dashboard/transactions.dart';

class Transaction_card extends StatelessWidget {
  Transaction_card({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.subtitle,
    required this.isexpense,
    required this.isdark,
    required this.index,
  });

  final double height;
  final double width;
  final String title;
  final String subtitle;
  final bool isexpense;
  final bool isdark;
  final int index;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMMMEd().format(now);
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 0.15 * height,
      width: width,
      child: Card(
        color: isdark ? const Color.fromARGB(255, 16, 14, 14) : tcarddark,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                const SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return TransactionDetails(
                                  amount: title,
                                  date: formattedDate,
                                  reason: subtitle);
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.remove_red_eye_sharp)),
                ),
              ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    isexpense ? '-\$ $title' : '+\$ $title',
                    style: TextStyle(
                      color: isexpense ? Colors.red : Colors.green,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
