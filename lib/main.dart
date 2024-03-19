import 'package:compound_calc/application.dart';
import 'package:flutter/material.dart';
import 'package:tailwind/utilities/TwService.dart';

void main() async {
  await TwService.init();
  runApp(const Application());
}
