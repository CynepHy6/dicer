import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  final int maxRoll;
  const Dice({
    Key? key,
    required this.maxRoll,
  }) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  Random random = Random(DateTime.now().millisecondsSinceEpoch);
  int? roll;

  @override
  void initState() {
    super.initState();
    roll = random.nextInt(widget.maxRoll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: _back,
            child: const Icon(Icons.arrow_back),
          ),
        ],
        title: Text('Случайное число от 1 до ${widget.maxRoll}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (roll == null) const CircularProgressIndicator(),
            if (roll != null)
              TextButton(
                onPressed: _rollDice,
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                ),
                child: Text(
                  roll.toString(),
                  style: const TextStyle(
                    fontSize: 400,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  _rollDice() {
    setState(() {
      roll = null;
    });
    Timer(const Duration(milliseconds: 300), () {
      setState(() {
        roll = random.nextInt(widget.maxRoll) + 1;
      });
    });
  }

  _back() {
    Navigator.pop(context);
  }
}
