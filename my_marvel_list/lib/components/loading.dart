import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/animations/loading.json',
        width: 512,
        height: 512,
        fit: BoxFit.contain,
      ),
    );
  }
}
