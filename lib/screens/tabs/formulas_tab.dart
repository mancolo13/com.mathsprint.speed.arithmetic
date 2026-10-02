import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class FormulasTab extends StatelessWidget {
  const FormulasTab({super.key});

  @override
  Widget build(BuildContext context) {
    final formulas = [
      {'title': 'Multiply by 11', 'trick': 'For 2-digit numbers: Add digits and place between. E.g. 35 x 11 = 3(3+5)5 = 385.'},
      {'title': 'Square of Numbers Ending in 5', 'trick': 'Multiply first digit by (digit+1) and append 25. E.g. 65²: 6x7=42 -> 4225.'},
      {'title': 'Fast 15% Tip', 'trick': 'Find 10% (move decimal left) and add half of that value.'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Mental Shortcuts'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: formulas.length,
        itemBuilder: (ctx, i) {
          final f = formulas[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(f['title'] as String, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                  const SizedBox(height: 6),
                  Text(f['trick'] as String, style: const TextStyle(height: 1.4)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
