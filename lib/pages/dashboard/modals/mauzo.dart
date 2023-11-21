import 'package:hive/hive.dart';
import 'package:nmtchat/utils/boxes.dart';
part 'mauzo.g.dart';

@HiveType(typeId: 1)
class mauzo extends HiveObject {
  @HiveField(0)
  final String reason;

  @HiveField(1)
  int amount;

  mauzo({required this.amount, required this.reason});

  // open a hive box for data storage

  void addData() async {
    var data = mauzo(amount: amount, reason: reason);
    mauzobox.put('key_$reason', data);
    // mauzobox.put(1, amount);

// JUMLA YA MAUZO YOTE YANAKAA HAPA
    if (jumlabox.isEmpty || jumlabox.get(1) == null) {
      jumlabox.put(1, amount);
    } else {
// weka jumla ya matumizi yako
      var x = jumlabox.get(1);
      x = x + amount;
      jumlabox.put(1, x);
    }

    //await mauzobox.close();
  }
}
