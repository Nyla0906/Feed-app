import 'package:flutter/material.dart';
import 'package:mircos/common/extensions/text_extentions.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: "OOPS something went wrong".s(24).w(600),
      ),
    );
  }
}
