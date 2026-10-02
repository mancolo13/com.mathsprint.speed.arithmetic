import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class TimedTab extends StatefulWidget {
  const TimedTab({super.key});

  @override
  State<TimedTab> createState() => _TimedTabState();
}

class _TimedTabState extends State<TimedTab> {
  int _score = 0;
  int _qIndex = 0;
  final _questions = [
    {'q': '17 + 28 = ?', 'a': ['45', '43', '47', '55'], 'c': 0},
    {'q': '14 x 6 = ?', 'a': ['74', '84', '94', '64'], 'c': 1},
    {'q': '144 / 12 = ?', 'a': ['14', '11', '12', '16'], 'c': 2},
  ];

  @override
  Widget build(BuildContext context) {
    final curr = _questions[_qIndex % _questions.length];
    return Scaffold(
      appBar: AppBar(title: const Text('Speed Math Sprint'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Score: $_score', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.primary)),
              const Chip(label: Text('⏱ 45s left'), backgroundColor: Colors.white12),
            ],
          ),
          const SizedBox(height: 36),
          Card(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              child: Text(
                curr['q'] as String,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ...(curr['a'] as List<String>).asMap().entries.map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.surface),
                  onPressed: () {
                    setState(() {
                      if (e.key == curr['c']) _score += 10;
                      _qIndex++;
                    });
                  },
                  child: Text(e.value, style: const TextStyle(fontSize: 20)),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
