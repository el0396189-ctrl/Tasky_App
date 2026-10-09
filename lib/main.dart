import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskyapp/Screens/MainPage.dart';
import 'package:taskyapp/Screens/Splach.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('tasks');

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MyApp(userName: prefs.getString('userName')));
}

class MyApp extends StatelessWidget {
  final String? userName;

  const MyApp({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.light(),

      darkTheme: ThemeData.dark(),

      home: userName == null ? const Splash() : MainPage(name: userName!),
    );
  }
}
