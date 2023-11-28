import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Provider imports
import 'providers/auth.dart';
//Screen imports
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/tabs_screen.dart';

import 'services/auth/login_or_register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Auth())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: Colors.black.withOpacity(0)),
            fontFamily: 'Poppins',
            primarySwatch: Colors.blue,
          ),
          home: const TabsScreen()),
    );
  }
}
