import 'package:flutter/material.dart';

class BuildScreen extends StatelessWidget {
  const BuildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Build'),
      ),
      body: const Center(
        child: Text('Build Screen - TODO'),
      ),
    );
  }
}
