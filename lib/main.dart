import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nmtchat/pages/dashboard/dashboard.dart';
import 'package:nmtchat/pages/dashboard/modals/matumizi.dart';
import 'package:nmtchat/pages/dashboard/modals/mauzo.dart';
import 'package:nmtchat/utils/boxes.dart';
import 'package:nmtchat/utils/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(mauzoAdapter());
  Hive.registerAdapter(matumiziAdapter());
  mauzobox = await Hive.openBox<mauzo>('mauzo');
  matumiziBox = await Hive.openBox<matumizi>('matumizi');
  jumlabox = await Hive.openBox('jumla');
  //await Hive.openBox('matumizi');

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Dashboard(),
      theme: Tapptheme.lighttheme,
      darkTheme: Tapptheme.darktheme,
      themeMode: ThemeMode.system,
    );
  }
}
