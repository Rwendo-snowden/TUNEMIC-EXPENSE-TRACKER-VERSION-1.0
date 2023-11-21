import 'package:hive/hive.dart';
import 'package:nmtchat/utils/boxes.dart';
part 'matumizi.g.dart';

@HiveType(typeId: 0)
class matumizi extends HiveObject {
  @HiveField(1)
  int amount;
  @HiveField(2)
  final String reason;

  matumizi({required this.amount, required this.reason});

  void addmatumizi() async {
    var data = matumizi(amount: amount, reason: reason);

    matumiziBox.put('key_$reason', data);

    // JUMLA YA MATUMIZI YOTE YANAKAA HAPA

    if (jumlabox.isEmpty || jumlabox.get(2) == null) {
      jumlabox.put(2, amount);
    } else {
      var x = jumlabox.get(2);
      x = x + amount;
      jumlabox.put(2, x);
    }
    //transactionList.add(matumiziBox.put('key_$reason', data));
  }
}
