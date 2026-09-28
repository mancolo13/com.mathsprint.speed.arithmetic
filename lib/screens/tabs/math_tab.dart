import 'dart:math';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/storage_service.dart';

class MathTab extends StatefulWidget {
  const MathTab({super.key});

  @override
  State<MathTab> createState() => _MathTabState();
}

class _MathTabState extends State<MathTab> {
  int _score = 0;
  late int _a;
  late int _b;
  late String _op;
  late int _correct;
  late List<int> _options;

  @override
  void initState() {
    super.initState();
    _score = StorageService.getInt('math_score');
    _newProblem();
  }

  void _newProblem() {
    final rand = Random();
    _a = rand.nextInt(30) + 5;
    _b = rand.nextInt(20) + 2;
    if (rand.nextBool()) {
      _op = '+';
      _correct = _a + _b;
    } else {
      _op = '×';
      _correct = _a * _b;
    }
    _options = [_correct, _correct + 3, _correct - 4, _correct + 7]..shuffle();
  }

  void _answer(int val) {
    if (val == _correct) {
      setState(() {
        _score += 10;
        StorageService.setInt('math_score', _score);
        _newProblem();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wrong answer, try again!'), duration: Duration(milliseconds: 600)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MathSprint Speed Challenge'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Score: $_score', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.secondary)),
              const SizedBox(height: 36),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
                  child: Text('$_a $_op $_b = ?', style: const TextStyle(fontSize: 44, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 40),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2.2,
                children: _options.map((opt) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.surface,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () => _answer(opt),
                    child: Text('$opt', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
