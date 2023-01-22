import 'package:flutter/material.dart';
import 'package:flutter_websocket_app/websocket/websocket_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              backgroundColor: Color.fromARGB(255, 224, 228, 229),
              scaffoldBackgroundColor: Color.fromARGB(255, 224, 228, 229),
            ),
            home: const WebsocketPage(),
            // home: Text('dfgdfg'),
          );
        });
  }
}
