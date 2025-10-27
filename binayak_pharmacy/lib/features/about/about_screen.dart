import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String _version = '';
  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((info) => setState(() => _version = info.version));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/logo.png', width: 96, height: 96),
              const SizedBox(height: 12),
              const Text('Binayak Medicine Store', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              const Text('Owner: Suman Sahu'),
              const Text('Created by Roshan'),
              const SizedBox(height: 12),
              Text('Version: ${_version.isEmpty ? '...' : _version}'),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () => launchUrl(Uri.parse('mailto:roshan8800jp@gmail.com?subject=Binayak%20Medicine%20Store%20Support')),
                icon: const Icon(Icons.support_agent_outlined),
                label: const Text('Support & Bug Report'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}