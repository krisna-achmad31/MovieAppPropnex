import 'package:PropnexTestApp/binding/AppBinding.dart';
import 'package:PropnexTestApp/controller/HomeController.dart';
import 'package:PropnexTestApp/controller/MainPageController.dart';
import 'package:PropnexTestApp/controller/SplashController.dart';
import 'package:PropnexTestApp/pages/DetailPage.dart';
import 'package:PropnexTestApp/pages/HomePage.dart';
import 'package:PropnexTestApp/pages/ListPage.dart';
import 'package:PropnexTestApp/pages/MainPage.dart';
import 'package:PropnexTestApp/pages/SearchPage.dart';
import 'package:PropnexTestApp/pages/Splash.dart';
import 'package:PropnexTestApp/pages/TrendingPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(SplashController());
  // Get.put(MainPageController());
  // Get.put(HomeController());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Propnex',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Colors.pink.shade50,
      ),
      initialRoute: SplashPage.routedName,
      initialBinding: AppBinding(),
      getPages: [
        GetPage(name: SplashPage.routedName, page: () => SplashPage()),
        GetPage(name: MainPage.routedName, page: () => MainPage()),
        GetPage(name: HomePage.routedName, page: () => HomePage(), transition: Transition.leftToRight),
        GetPage(name: SearchPage.routedName, page: () => SearchPage(), transition: Transition.rightToLeft),
        GetPage(name: DetailPage.routedName, page: () => DetailPage(), transition: Transition.fadeIn),
        GetPage(name: ListPage.routedName, page: () => ListPage()),
        GetPage(name: TrendingPage.routedName, page: () => TrendingPage()),
      ],
    );
  }

// void registerNotification() async {
//   // 1. Initialize the Firebase app
//   await Firebase.initializeApp();
//
//   // 2. Instantiate Firebase Messaging
//   FirebaseMessaging _messaging = FirebaseMessaging.instance;
//
//   // 3. On iOS, this helps to take the user permissions
//   NotificationSettings settings = await _messaging.requestPermission(
//     alert: true,
//     badge: true,
//     provisional: false,
//     sound: true,
//   );
//
//   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     print('User granted permission');
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   } else {
//     print('User declined or has not accepted permission');
//   }
// }
}

// Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("Handling a background message: ${message.messageId} ${message.data}");
//   AwesomeNotifications().createNotification(
//     content: NotificationContent(
//       id: 902,
//       channelKey: 'basic_channel',
//       title: message.data["title"],
//       body: message.data["body"],
//       payload: {"invitationId": message.data["invitationId"]},
//     ),
//   );
// }
