import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micros/common/extensions/text_extentions.dart';
import 'package:micros/common/common_widgets/custom_appbar.dart';
import 'package:micros/features/presentation/pages/detail/detail_page.dart';
import 'package:micros/features/presentation/pages/feed/bloc/feed_bloc.dart';
import 'package:micros/features/presentation/pages/feed/bloc/feed_event.dart';
import 'package:micros/features/presentation/pages/feed/bloc/feed_state.dart';


class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "Favourites".s(20).w(800), centreTitle: true),
      body: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) {
          if (state.favourites.isEmpty) {
            return Center(child: "Пока нет сохраненных новостей".s(18).w(500));
          }
          return ListView.builder(
            itemCount: state.favourites.length,
            itemBuilder: (context, index) {
              final fav = state.favourites[index];
              final title = fav['title']?['__cdata'] ?? 'No title';
              final imageUrl = fav['media\$content']?['url'];
              final date = fav['pubDate']?['__cdata'] ?? '';
              final description = fav['description']?['__cdata'] ?? '';

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(
                          title: title,
                          imageData: imageUrl ?? '',
                          description: description,
                          date: date,
                        ),
                      ),
                    );
                  },
                  leading: imageUrl != null
                      ? Image.network(
                          imageUrl,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.image_not_supported),
                  title: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(date),
                  trailing: IconButton(
                    tooltip: 'Remove from favourites',
                    icon: const Icon(Icons.cancel, color: Colors.red),
                    onPressed: () {
                      context.read<FeedBloc>().add(
                        RemoveFromFavouritesEvent(fav),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
