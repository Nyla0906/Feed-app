import 'package:flutter/material.dart';
import 'package:micros/common/router/my_router.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Routing.router,
    );
  }
}
