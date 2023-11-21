import 'package:flutter/material.dart';
import 'package:nmtchat/pages/dashboard/commonwidgets/transactioninfo.dart';

class TransactionDetails extends StatelessWidget {
  TransactionDetails(
      {super.key,
      required this.amount,
      required this.date,
      required this.reason});

  final String amount;
  final String date;
  final String reason;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Transaction Details'), Icon(Icons.share)],
        ),
        toolbarHeight: height * 0.1,
      ),
      body: Column(
        children: [
          const TransactionInfo(title: 'Kichwa cha habari', subtitle: 'Hp'),
          TransactionInfo(title: 'kiasi kilichotumika', subtitle: amount),
          const TransactionInfo(
              title: 'Aina ya Transaction', subtitle: 'Mauzo'),
          TransactionInfo(title: 'Tarehe ya tukio.......', subtitle: date),
          //   ExpansionTile(

          TransactionInfo(title: 'sababu ya matumizi', subtitle: reason),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
    );
  }
}
