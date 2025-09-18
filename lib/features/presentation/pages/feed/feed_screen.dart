import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mircos/common/extensions/text_extentions.dart';
import 'package:mircos/common/common_pages/error_page.dart';
import 'package:mircos/common/common_widgets/custom_appbar.dart';
import 'bloc/feed_bloc.dart';
import 'bloc/feed_state.dart';
import 'feed_item_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          title: "Top News".s(20).w(800),
          centreTitle: true,
      ),
      body: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.error != null) {
            return const ErrorPage();
          }
          if (state.feedItems.isEmpty) {
            return  Center(
                child: 'Info not found'.s(18).w(20),
            );
          }

          return ListView.builder(
            itemCount: state.feedItems.length,
            itemBuilder: (context, index) {
              final item = state.feedItems[index];
              final title = _extractField(item, 'title');
              final description = _extractField(item, 'description');
              final date = _extractField(item, 'pubDate');
              final imageUrl = item['media\$content']?['url'];
              final isFavourite = state.favourites.any(
                (fav) => _extractField(fav, 'title') == title,
              );

              return FeedItemCard(
                title: title,
                description: description,
                date: date,
                imageUrl: imageUrl,
                isFavourite: isFavourite,
                item: item,
              );
            },
          );
        },
      ),
    );
  }

  static String _extractField(Map<String, dynamic> item, String key) {
    return item[key]?['__cdata'] ?? item[key] ?? '';
  }
}
