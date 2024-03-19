import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:tailwind/tailwind.dart';
import 'package:tailwind/utilities/TwService.dart';

part '.generated/application.g.dart';

@swidget
Widget application() {
  return TwAppBuilder(builder: (context, themeMode) {
    return MaterialApp(
      key: TwService.appKey,
      themeMode: themeMode,
      home: const Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  });
}
