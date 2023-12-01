import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se_proj/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            // title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'Poppins', scaffoldBackgroundColor: Colors.black,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              // primarySwatch: Colors.blue,
            ),
            home: const Home(),
            // initialRoute: Home.id,
            routes: {
              Home.id: (context) => const Home(),
            },
            // home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        });
  }
}

