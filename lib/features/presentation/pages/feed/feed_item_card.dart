import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mircos/common/gen/assets.gen.dart';
import 'package:mircos/common/storage/route_paths.dart';
import 'bloc/feed_bloc.dart';
import 'bloc/feed_event.dart';

class FeedItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String? imageUrl;
  final bool isFavourite;
  final Map<String, dynamic> item;

  const FeedItemCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.imageUrl,
    required this.isFavourite,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
          horizontal: 12, vertical: 6,
      ),
      child: ListTile(
        leading: imageUrl != null
            ? Image.network(
          imageUrl!, width: 80,
          fit: BoxFit.cover,
        )
            : const Icon(Icons.image_not_supported),
        title: Text(
            title, maxLines: 2,
            overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(date),
        trailing: IconButton(
          icon: SvgPicture.asset(
            Assets.icons.star.path,
            colorFilter: ColorFilter.mode(
              isFavourite ? Colors.yellow : Colors.grey,
              BlendMode.srcIn,
            ),
            width: 24,
            height: 24,
          ),
          onPressed: () {
            context.read<FeedBloc>().add(
              isFavourite
                  ? RemoveFromFavouritesEvent(item)
                  : AddToFavouritesEvent(item),
            );
          },
        ),
        onTap: () {
          context.push(
            RoutePaths.detailScreen,
            extra: {
              "title": title,
              "description": description,
              "imageUrl": imageUrl,
              "date": date,
            },
          );
        },
      ),
    );
  }
}
