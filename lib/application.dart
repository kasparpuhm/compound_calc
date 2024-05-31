import 'package:compound_calc/modules/interest-calculator/compound_interest_calculator.dart';
import 'package:flutter/material.dart';
import 'package:tailwind/tailwind.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return TwAppBuilder(builder: (context, themeMode) {
      return MaterialApp(
        key: TwService.appKey,
        themeMode: themeMode,
        home: const Scaffold(
          body: Center(
            child: CompoundInterestCalculator(),
          ),
        ),
      );
    });
  }
}
