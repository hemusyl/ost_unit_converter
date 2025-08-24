import 'package:flutter/material.dart';
import '../presentation/ui/screens/home_screen.dart';

class UnitConverter extends StatelessWidget {
  const UnitConverter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
