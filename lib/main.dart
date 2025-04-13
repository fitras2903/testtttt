import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'pages/halaman_counter.dart';
import 'pages/halaman_api.dart';
import 'pages/halaman_profil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Flutter 3 Halaman',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [HalamanCounter(), HalamanApi(), HalamanProfil()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.add), label: 'Counter'),
          BottomNavigationBarItem(icon: Icon(Iconsax.folder), label: 'API'),
          BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'Profil'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
