import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_marvel_list/utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadSplash();
  }

  Future<Timer> _loadSplash() async {
    return Timer(
      const Duration(
        seconds: 3,
      ),
      _onDoneLoading,
    );
  }

  _onDoneLoading() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.seriesSelection);
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animations/splash.json',
          fit: BoxFit.cover,
        ),
      ),
      backgroundColor: const Color.fromRGBO(29, 152, 213, 1),
    );
  }
}
