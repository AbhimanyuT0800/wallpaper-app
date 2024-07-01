import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // router path for navigation
  static const routerPath = 'HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
