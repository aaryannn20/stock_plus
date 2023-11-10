import "package:flutter/material.dart";

import './home_screen.dart';
import './markets_screen.dart';

import './watchlist_screen.dart';
import '../../configs/custom_icons.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = "/tabs";

  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {"page": const HomeScreen(), "title": "Stocks+"},
      {"page": const MarketsScreen(), "title": "Market"},
      {"page": const WatchlistScreen(), "title": "Watchlist"},
    ];
    super.initState();
  }

  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]["title"] as String),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages.map((data) => data['page'] as Widget).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: _selectPage,
        enableFeedback: false,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(fontFamily: "Poppins"),
        selectedLabelStyle: const TextStyle(fontFamily: "Poppins"),
        unselectedItemColor: const Color(0xFFa0b0ba),
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(CustomIcons.home), label: "News"),
          BottomNavigationBarItem(icon: Icon(CustomIcons.bar), label: "Market"),
          BottomNavigationBarItem(
              icon: Icon(CustomIcons.eye_outline),
              activeIcon: Icon(CustomIcons.eye),
              label: "Watchlist"),
        ],
      ),
    );
  }
}
