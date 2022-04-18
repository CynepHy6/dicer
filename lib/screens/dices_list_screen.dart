import '../models/Dice.dart';
import 'package:flutter/material.dart';

class DicesListScreen extends StatelessWidget {
  final List<Dice> dices = [const Dice(maxRoll: 6)];
  DicesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Список кубиков'),
      ),
      body: ListView.builder(
        itemCount: dices.length,
        itemBuilder: (context, index) {
          final dice = dices[index];

          return ListTile(
            title: Text('Кубик 1-${dice.maxRoll}'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => dice)),
          );
        },
      ),
    );
  }
}
