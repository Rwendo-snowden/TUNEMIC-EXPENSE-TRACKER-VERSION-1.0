import 'package:flutter/material.dart';
import 'package:nmtchat/pages/dashboard/modals/matumizi.dart';

import 'package:nmtchat/pages/dashboard/modals/mauzo.dart';
import 'package:nmtchat/utils/boxes.dart';

class popupform extends StatefulWidget {
  popupform({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<popupform> createState() => _popupformState();
}

class _popupformState extends State<popupform> {
  TextEditingController amountController = TextEditingController();

  TextEditingController reasonController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var amount;
  // ignore: prefer_typing_uninitialized_variables
  var reason;

  void _setmauzo() {
    setState(() {
      amount = amountController.text;
      reason = reasonController.text;
      var mauzoyote = mauzo(amount: int.parse(amount), reason: reason);

      mauzoyote.addData();

      // dismiss the pop up after form submission
      Navigator.of(context).pop();
    });
  }

  void _setmatumizi() {
    setState(() {
      amount = amountController.text;
      reason = reasonController.text;
      var matumiziyote = matumizi(amount: int.parse(amount), reason: reason);
      matumiziyote.addmatumizi();
      Navigator.of(context).pop();
    });
  }

  var mauzoyote = mauzo(amount: 3, reason: '');

  @override
  Widget build(BuildContext context) {
    // confirm if its mauzo or matumizi?
    bool ismauzo = widget.title == 'Mauzo';
    return Form(
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ),
          ),
          TextField(
            controller: amountController,
          ),
          TextField(
            controller: reasonController,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: ismauzo ? _setmauzo : _setmatumizi,
                child: const Text('kusanya'),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    amountController.text = '';
                    reasonController.text = '';
                  });
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                child: const Text(
                  'futa',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
