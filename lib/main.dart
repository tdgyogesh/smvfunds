import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'package:responsive_framework/responsive_framework.dart';

import 'Portal.dart';

/*import 'firebase_options.dart';*/

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /* await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  //FirebaseMessaging.onBackgroundMessage(firebaseMessaginhBackgroungHandler);
  //await FireBaseNotificationService().initNotifications();
  runApp(const MyApp());
}

/*@pragma('vm:entry-point')
Future<void> firebaseMessaginhBackgroungHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, widget) {
        widget = ResponsiveBreakpoints.builder(
          child: widget!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        );

        ScreenUtil.init(
          context,
          designSize: Get.width >= 500 ? Size(1920, 1080) : Size(390, 844),
        );
        return widget!;
      },
      home: MyHomePage(),
      initialRoute: '/',
      navigatorKey: navigatorKey,
      getPages: [
        GetPage(name: '/', page: () => Portal()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'SM Ventures',
      theme: ThemeData(
        // scaffoldBackgroundColor: light,
        // textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
        //     .apply(bodyColor: Colors.black),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primarySwatch: Colors.blue,
      ),
      // home: AuthenticationPage(),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   builder: (context, widget) {
    //     ScreenUtil.init(
    //       context,
    //       designSize: const Size(1920, 1080),
    //     );
    //     return widget!;
    //   },
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Portal();
  }
}
