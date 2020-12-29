import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  return runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => ModularApp(
        module: AppModule(),
      ),
    ),
  );
}
