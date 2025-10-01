import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walk_through/statemanegment/countermodel.dart';

import 'walking troughscreen/onbording_screen.dart';
import 'walking troughscreen/personal_information.dart';
import 'walking troughscreen/splash_screen.dart';


void main() {
  runApp( ChangeNotifierProvider(
    create: (_) => CounterModel(),
    child: const MyApp(),
  ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen()
    );
  }
}

