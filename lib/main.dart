import 'package:eden_task/app/app.dart';
import 'package:eden_task/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  setup();
  runApp(const EdenApp());
}

// ignore:  inference_failure_on_function_return_type, always_declare_return_types, type_annotate_public_apis
setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  await dotenv.load();
}

