import 'package:clean_architecture_fluterando/app_modular.dart';
import 'package:clean_architecture_fluterando/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  return runApp(ModularApp(module: AppModular(), child: AppWidget()));
}
