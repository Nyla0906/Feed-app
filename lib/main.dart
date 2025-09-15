import 'package:flutter/material.dart';

void main() {
  runApp(const RssApp());
}

class RssApp extends StatelessWidget {
  const RssApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RSS Reader',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    FeedScreen(),
    FavoritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // keyinchalik Cubit bilan ListView.builder ulaysan
    return Scaffold(
      appBar: AppBar(title: const Text("News Feed")),
      body: ListView.builder(
        itemCount: 10, // Cubit bilan dynamic bo‘ladi
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.article_outlined),
            title: Text("News Title $index"),
            subtitle: const Text("Short description of the news..."),
            trailing: IconButton(
              icon: const Icon(Icons.star_border),
              onPressed: () {
                // sevimlilarga qo‘shish
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DetailScreen(
                    title: "Sample Title",
                    description: "Full description here...",
                    link: "https://example.com",
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

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: ListView.builder(
        itemCount: 3, // Cubit bilan dynamic bo‘ladi
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.star, color: Colors.amber),
            title: Text("Favorite Item $index"),
            subtitle: const Text("Saved news description..."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DetailScreen(
                    title: "Favorite Title",
                    description: "Favorite news full text...",
                    link: "https://example.com",
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

class DetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final String link;

  const DetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Bu joyda launchUrl bilan browser ochasan
              },
              child: Text("Read more: $link"),
            ),
          ],
        ),
      ),
    );
  }
}
