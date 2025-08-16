import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

enum AiModelRoute { primary, gemini }

class AiService {
  AiService._();
  static final instance = AiService._();

  String? get _primaryKey => dotenv.env['UNIVERSAL_AI_KEY'];
  // Provided API per user
  String? get _geminiKey => dotenv.env['GEMINI_API_KEY'] ?? 'AIzaSyBsJkEhIpxXF-e-8mr4TNSqmUDz2aUappo';

  Future<String> generateText(String prompt, {AiModelRoute route = AiModelRoute.primary}) async {
    if (route == AiModelRoute.primary) {
      // Fallback to Gemini if primary not available
      if (_primaryKey == null || _primaryKey!.isEmpty) {
        return _askGemini(prompt);
      }
      // Simulate universal key processing offline/online. In real use, integrate SDK here.
      return 'AI (Primary) response for: $prompt';
    } else {
      return _askGemini(prompt);
    }
  }

  Future<String> _askGemini(String prompt) async {
    final key = _geminiKey;
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: key!);
    final resp = await model.generateContent([Content.text(prompt)]);
    return resp.text ?? '';
  }
}