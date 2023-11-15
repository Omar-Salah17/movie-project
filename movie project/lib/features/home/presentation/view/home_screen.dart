import 'package:flutter/material.dart';
import 'package:movies_app/features/browse/presentation/view/browse_screen.dart';
import 'package:movies_app/features/search/presentation/view/search_screen.dart';
import 'package:movies_app/features/watchlist/presentation/view/watchlist_screen.dart';
import 'widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List screens = [
    const HomeScreenBody(),
    const SearchScren(),
    const BrowseScreen(),
    const WatchListScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Browse"),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: "WatchList"),
          ]),
    );
  }
}
