import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromRGBO(242, 247, 255, 1),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedIconTheme: const IconThemeData(color: kBlue),
          selectedItemColor: kBlue,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/home.svg',
                  color: myIndex == 0 ? kBlue : Colors.grey,
                ),
                label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded), label: 'Message'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_rounded), label: 'Near Me'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Account'),
          ]),
    );
  }
}
