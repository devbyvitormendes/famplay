import 'package:flutter/material.dart';

class FamplayNavGlobalKey {
  static FamplayNavGlobalKey? _instance;
  final navKey = GlobalKey<NavigatorState>();

  FamplayNavGlobalKey._();

  static FamplayNavGlobalKey get instance =>
      _instance ??= FamplayNavGlobalKey._();
}