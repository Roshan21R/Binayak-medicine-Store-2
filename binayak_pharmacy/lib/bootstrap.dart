import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:binayak_pharmacy/app/app.dart';
import 'package:binayak_pharmacy/core/env/env.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvConfig.load();
  runZonedGuarded(() {
    runApp(const ProviderScope(child: App()));
  }, (error, stack) {
    debugPrint('Uncaught error: $error');
  });
}