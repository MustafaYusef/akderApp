import 'package:akhder_app/ui/mainScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() => runApp(
      EasyLocalization(
          path: "lang",
          saveLocale: true,
          startLocale: Locale("ar"),
          useOnlyLangCode: true,
          supportedLocales: [Locale("ar")],
          child: baseWedget()),
    );

class baseWedget extends StatefulWidget {
  const baseWedget({Key? key}) : super(key: key);

  @override
  _baseWedgetState createState() => _baseWedgetState();
}

class _baseWedgetState extends State<baseWedget> {
  @override
  void initState() {
    // getToken();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId("23f97bf3-bc7a-4a47-b1f7-0e983fe613a8");
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      /// Display Notification, send null to not display, send notification to display
      event.complete(event.notification);
    });
    return GetMaterialApp(
        theme: ThemeData(
            primaryColor: Color(0xff01AC06),
            primaryColorDark: Color.fromARGB(255, 1, 141, 5),
            accentColor: Color(0xffFFE000),
            // canvasColor: Color(0xffD00216),
            // progressIndicatorTheme: ,
            progressIndicatorTheme: ProgressIndicatorThemeData(
              color: Color(0xffD00216),
            ),
            // progressIndicatorTheme: Color(0xffD00216),
            fontFamily: "Arabic",
            appBarTheme:
                AppBarTheme(iconTheme: IconThemeData(color: Colors.white))),
        darkTheme: ThemeData(
            primaryColor: Color(0xff01AC06),
            primaryColorDark: Color.fromARGB(255, 1, 141, 5),
            accentColor: Color(0xffFFE000),
            fontFamily: "Arabic",
            appBarTheme:
                AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),
        debugShowCheckedModeBanner: false,
        enableLog: true,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        defaultTransition: Transition.rightToLeft,
        locale: context.locale,
        // locale: Get.deviceLocale,
        home: Main(0));
  }
}

class Main extends StatefulWidget {
  int? indexB = 0;
  Main([this.indexB]);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with TickerProviderStateMixin {
  // final Connectivity _connectivity = Connectivity();
  // StreamSubscription<ConnectivityResult> _connectivitySubscription;
  // ItemDetailsController controller = Get.put(ItemDetailsController());
  // FavouriteController favouriteController = Get.put(FavouriteController());
  // SectionsController _controller = Get.put(SectionsController());

  @override
  void initState() {
    _child = MainScreen();

    super.initState();
  }

  bool isOpened = false;

  MainScreen? _child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          )),
      body: MainScreen(),
      // bottomNavigationBar: ClipRRect(
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(25.0),
      //     topRight: Radius.circular(25.0),
      //   ),
      //   child: BottomNavyBar(
      //     showElevation: true,
      //     containerHeight: 60,
      //     itemCornerRadius: 20,

      //     backgroundColor: Colors.white,
      //     selectedIndex: widget.indexB!,
      //     items: [
      //       BottomNavyBarItem(
      //           icon: Icon(
      //             Icons.home_outlined,
      //             size: 30,
      //           ),
      //           inactiveColor: Colors.grey,
      //           activeColor: Colors.white,
      //           title: Text("الرئيسية"),
      //           textAlign: TextAlign.start),
      //       BottomNavyBarItem(
      //           inactiveColor: Colors.grey,
      //           icon: Icon(Icons.favorite_border),
      //           activeColor: Colors.white,
      //           title: Text("المفضلة"),
      //           textAlign: TextAlign.start),
      //       BottomNavyBarItem(
      //           inactiveColor: Colors.grey,
      //           icon: Icon(Icons.list),
      //           activeColor: Colors.white,
      //           title: Text("الأقسام"),
      //           textAlign: TextAlign.start),
      //       BottomNavyBarItem(
      //           inactiveColor: Colors.grey,
      //           activeColor: Colors.white,
      //           icon: Icon(Icons.settings),
      //           title: Text("الحساب"),
      //           textAlign: TextAlign.start),
      //     ],
      //     onItemSelected: (int value) {
      //       setState(() {
      //         widget.indexB = value;
      //       });
      //     },
      //     // key: key,
      //     // key: null,
      //   ),
      // ),
      // bottomNavigationBar: Container(
      //   height: 70,
      //   color: Colors.transparent,
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(30.0),
      //       topRight: Radius.circular(30.0),
      //     ),
      //     child: BottomNavigationBar(
      //       elevation: 0,
      //       type: BottomNavigationBarType.fixed,
      //       backgroundColor: Colors.white,
      //       items: [
      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.home_outlined,
      //                 size: 30,
      //                 color: widget.indexB == 0
      //                     ? Theme.of(context).primaryColor
      //                     : Colors.grey),
      //             title: Container()),
      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.favorite_border,
      //                 color: widget.indexB == 1
      //                     ? Theme.of(context).primaryColor
      //                     : Colors.grey),
      //             title: Container()),
      //         BottomNavigationBarItem(
      //             icon: Container(
      //               child: Container(
      //                 child: Icon(Icons.shopping_cart,
      //                     color: widget.indexB == 2
      //                         ? Get.theme.primaryColor
      //                         : Colors.grey),
      //               ),
      //             ),
      //             title: Container()),
      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.person_outline,
      //                 color: widget.indexB == 3
      //                     ? Theme.of(context).primaryColor
      //                     : Colors.grey),
      //             title: Container())
      //       ],
      //       onTap: (index) {
      //         //Handle button tap
      //         print(index);
      //         setState(() {
      //           widget.indexB = index;
      //         });
      //       },
      //     ),
      //   ),
      // ),
    );
  }

  // Widget? selectedWidget(int? index) {
  //   if (index == 0) {
  //     return _child;
  //   } else if (index == 1) {
  //     return FavouriteScreen();
  //   } else if (index == 2) {
  //     return SectionsItemScreen(0);
  //   } else if (index == 3) {
  //     return ProfileScreen();
  //   }
  // }
}
