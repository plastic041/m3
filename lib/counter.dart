import 'dart:io';

import 'package:flutter/material.dart';
import 'package:m3/counter_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  final CounterStorage storage = CounterStorage();

  @override
  Widget build(BuildContext context) {
    return Counter(storage: storage);
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key, required this.storage});

  final CounterStorage storage;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _increamentCounter() {
    setState(() {
      _counter++;
    });

    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _increamentCounter,
              child: const Text('Increment'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Count: ',
                ),
                Text(
                  '$_counter',
                  style: TextStyle(
                    fontFamily: GoogleFonts.firaMono(
                      fontWeight: FontWeight.bold,
                    ).fontFamily,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
