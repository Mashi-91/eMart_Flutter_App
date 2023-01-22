import 'package:delivery_app/View/splash_screen/splash_screen.dart';
import 'package:delivery_app/consts/consts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'View/auth_screen/SignUp_Screen.dart';
import 'View/screens/Home_Screen/home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: darkFontGrey),
              backgroundColor: Colors.transparent),
          fontFamily: regular),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: (() => const SplashScreen())),
        GetPage(name: '/homescreen', page: (() => Home())),
        GetPage(name: '/signUp', page: (() => SigupScreen())),
      ],
    );
  }
}
