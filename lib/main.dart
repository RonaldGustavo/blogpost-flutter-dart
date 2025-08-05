import 'package:flutter/material.dart';
import 'screens/news_list_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static const List<String> _titles = [
    'Blog Posts Ronald',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF181A20),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF23272F),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF4F8FFF),
          secondary: const Color(0xFF23272F),
        ),
        cardColor: const Color(0xFF23272F),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF23272F),
          selectedItemColor: Color(0xFF4F8FFF),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            _titles[_selectedIndex],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 1.2,
            ),
          ),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            NewsListScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
