import 'package:flutter/material.dart';
import './home_screen.dart';
import './messages_screen.dart';
import './metrics_screen.dart';
import './profile_screen.dart';
import '../contants.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const routeName = '/tabscreen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = const [
    HomeScreen(),
    MessagesScreen(),
    MetricsScreen(),
    ProfileScreen()
  ];

  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: myIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(242, 247, 255, 1),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: kBlue,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded), label: 'Message'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_rounded), label: 'Near Me'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Account'),
          ]),
    );
  }
}
