import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Nav2',
      color: Colors.red,
      getPages: [
        GetPage(
          name: '/',
          page: () => GetRouterOutlet.builder(
            builder: (context, delegate, currentRoute) {
              return GetRouterOutlet(initialRoute: HomeScreen.route);
            },
          ),
          participatesInRootNavigator: true,
          preventDuplicates: true,
          children: [
            GetPage(
              name: HomeScreen.route,
              page: () => HomeScreen(),
            ),
          ],
        ),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  static String route = '/Home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        // color: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OpenContainer(
              useRootNavigator: true,
              routeSettings: RouteSettings(name: '/page2'),
              closedBuilder: (context, action) {
                return TextButton(
                  onPressed: action,
                  child: Text('OpenContainer test'),
                );
              },
              openBuilder: (context, action) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('OpenContainer'),
                  ),
                  body: Center(
                    child: Text('look at the URL'),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  useRootNavigator: true,
                  routeSettings: RouteSettings(name: '/dialog'),
                  context: context,
                  builder: (context) {
                    return AboutDialog(
                      applicationName: 'look at the URL',
                    );
                  },
                );
              },
              child: Container(
                child: Text('Dialog test'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
