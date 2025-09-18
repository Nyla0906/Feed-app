import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micros/features/presentation/pages/favourites/favourite_page.dart';
import 'package:micros/features/presentation/pages/feed/bloc/feed_bloc.dart';
import 'package:micros/features/presentation/pages/feed/bloc/feed_event.dart';
import 'package:micros/features/presentation/pages/feed/feed_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [const FeedScreen(), const FavouritePage()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FeedBloc()..add(LoadFeedEvent()),
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Feed'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourites',
            ),
          ],
        ),
      ),
    );
  }
}
