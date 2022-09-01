import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notim/states/authen.dart';
import 'package:notim/utility/my_constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });

  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authen(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: MyConstant.dart,
          elevation: 0,
        ),
      ),
    );
  }
}
