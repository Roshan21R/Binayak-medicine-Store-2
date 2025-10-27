import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static Future<void> load() async {
    try {
      await dotenv.load(fileName: '.env');
    } catch (_) {
      // Ignore if .env is missing; environment variables may come from the OS
    }
  }
}