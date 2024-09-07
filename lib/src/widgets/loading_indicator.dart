import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: LoadingIndicator(
        indicatorType: Indicator.ballPulse,
        colors: [
          Colors.red,
          Colors.orange,
          Colors.yellow,
        ],
        strokeWidth: 1,
      ),
    );
  }
}
