import 'package:flutter/material.dart';
import 'tab_menu.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabMenu(currentIndex: 0);  // Mengatur currentIndex ke 0
  }
}
