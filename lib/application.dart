import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part '.generated/application.g.dart';

@swidget
Widget application() {
  return const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Text('Hello World!'),
      ),
    ),
  );
}
