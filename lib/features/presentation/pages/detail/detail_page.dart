import 'package:flutter/material.dart';
import 'package:micros/common/extensions/text_extentions.dart';
import 'package:micros/common/common_widgets/custom_appbar.dart';


class DetailScreen extends StatelessWidget {
  final String title;
  final String imageData;
  final String description;
  final String date;

  const DetailScreen({
    super.key,
    required this.title,
    required this.imageData,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Details".s(20).w(800),
        centreTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Image.network(
              imageData,
              fit: BoxFit.cover, width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 16, horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  title.s(20).w(500),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child:
                    date.s(13).w(400),
                ),
                description.s(16).w(400),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
