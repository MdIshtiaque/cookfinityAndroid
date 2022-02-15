import 'package:cookfinity/loginscr.dart';
import 'package:cookfinity/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(330, 651),

      builder: () => MaterialApp(

        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),

    );
  }
}
