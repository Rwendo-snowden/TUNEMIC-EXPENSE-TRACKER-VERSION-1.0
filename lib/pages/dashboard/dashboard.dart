import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:nmtchat/pages/dashboard/commonwidgets/card.dart';
import 'package:nmtchat/pages/dashboard/commonwidgets/popupform.dart';
import 'package:nmtchat/pages/dashboard/commonwidgets/smallcard.dart';
import 'package:nmtchat/pages/dashboard/commonwidgets/transactioncard.dart';
import 'package:nmtchat/pages/dashboard/modals/matumizi.dart';
import 'package:nmtchat/pages/dashboard/modals/mauzo.dart';
import 'package:nmtchat/utils/boxes.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var brightness = MediaQuery.of(context).platformBrightness;
    var isdark = brightness == Brightness.dark;

    // dealing with jumla ya mauzo na matumizi logics
    //if jumlabox database at key 1 is equal tonull or empty keep the valeus as zero
    var jumlaYaMauzo =
        jumlabox.isEmpty || jumlabox.get(1) == null ? 0 : jumlabox.get(1);
    var jumlaYaMatumizi =
        jumlabox.isEmpty || jumlabox.get(2) == null ? 0 : jumlabox.get(2);

// salio=mauzo-matumizi
    var salio;
    if (jumlabox.isEmpty) {
      salio == "0";
    } else if (jumlabox.get(1) == null) {
      jumlabox.put(1, 0);
      jumlabox.get(1) - jumlabox.get(2);
    } else if (jumlabox.get(2) == null) {
      jumlabox.put(2, 0);
      jumlabox.get(1) - jumlabox.get(2);
    } else {
      salio = jumlabox.get(1) - jumlabox.get(2);
    }

    // logic for printing out the results in the list view builder function

    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Mama Emma App',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.note),
                label: Text('Keep Notes'),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('NMT DAFTARI'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.brightness_4,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Icon(Icons.more_vert),
              ],
            ),
          ],
        ),
        elevation: 0,
        toolbarHeight: 70,
      ),
      body: Column(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Balance_card(
              height: height,
              width: width,
              title: "Jumla ya salio :",
              subtitle: salio == null ? "0" : ' $salio/=',
              isdark: isdark,
            ),
            Row(
              children: [
                ccard(
                  height: height,
                  width: width,
                  title: "Mauzo",
                  subtitle: "+ $jumlaYaMauzo/=",
                  isExpense: false,
                  isdark: isdark,
                ),
                ccard(
                  height: height,
                  width: width,
                  title: "Matumizi",
                  subtitle: "- $jumlaYaMatumizi/=",
                  isExpense: true,
                  isdark: isdark,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Mihamala yako :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),

        // mauzo cards (recent transaction section)
        Expanded(
          child: ListView.builder(
            itemCount: mauzobox.length,
            itemBuilder: (BuildContext context, int index) {
              mauzo Mauzo = mauzobox.getAt(index);

              return Column(
                children: [
                  Slidable(
                    startActionPane: ActionPane(
                      motion: StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              mauzobox.deleteAt(index);
                            });
                          },
                          //

                          icon: (Icons.delete),
                          label: 'futa',
                          backgroundColor: Colors.red,
                        ),

                        //
                      ],
                    ),

                    //apply logic here
                    child: Transaction_card(
                      height: height,
                      width: width,
                      title: Mauzo.amount.toString(),
                      subtitle: Mauzo.reason,
                      isexpense: false,
                      isdark: isdark,
                      index: index,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        //matumizi cards(recent transaction section)
        Expanded(
          child: ListView.builder(
            itemCount: matumiziBox.length,
            itemBuilder: (BuildContext context, int index) {
              matumizi Matumizi = matumiziBox.getAt(index);

              return Column(
                children: [
                  Slidable(
                    startActionPane: ActionPane(
                      motion: StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              matumiziBox.deleteAt(index);
                            });
                          },
                          //

                          icon: (Icons.delete),
                          label: 'futa',
                          backgroundColor: Colors.red,
                        ),

                        //
                      ],
                    ),

                    //apply logic here
                    child: Transaction_card(
                      height: height,
                      width: width,
                      title: Matumizi.amount.toString(),
                      subtitle: Matumizi.reason,
                      isexpense: true,
                      isdark: isdark,
                      index: index,
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        // THIS BUTTON WILL CLEAR EVERY THING AVILABLE IN THE DATABASE (IN EVERY BOX)
        ElevatedButton(
          onPressed: () {
            setState(() {
              mauzobox.clear();
              matumiziBox.clear();
              jumlabox.clear();
            });
          },
          child: const Text('Clear'),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  'Fomu ya Mauzo na Matumizi',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: Column(
                  children: [
                    popupform(title: 'Matumizi'),
                    const SizedBox(
                      height: 40,
                    ),
                    popupform(title: 'Mauzo'),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
        backgroundColor: Color.fromARGB(255, 149, 142, 142),
      ),
    );
  }
}

//
