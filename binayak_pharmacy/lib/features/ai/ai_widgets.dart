import 'package:flutter/material.dart';
import 'package:binayak_pharmacy/features/ai/ai_service.dart';

class AiPromptCard extends StatefulWidget {
  const AiPromptCard({super.key});
  @override
  State<AiPromptCard> createState() => _AiPromptCardState();
}

class _AiPromptCardState extends State<AiPromptCard> {
  final _controller = TextEditingController(text: 'Suggest 3 stock optimization tips for a pharmacy.');
  String _result = '';
  bool _loading = false;

  Future<void> _run() async {
    setState(() => _loading = true);
    try {
      final text = await AiService.instance.generateText(_controller.text);
      setState(() => _result = text);
    } catch (e) {
      setState(() => _result = 'AI error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('AI Assistant', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            TextField(controller: _controller, maxLines: 3, decoration: const InputDecoration(border: OutlineInputBorder())),
            const SizedBox(height: 8),
            FilledButton(onPressed: _loading ? null : _run, child: Text(_loading ? 'Thinking…' : 'Ask AI')),
            const SizedBox(height: 8),
            Text(_result),
          ],
        ),
      ),
    );
  }
}