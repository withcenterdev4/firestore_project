import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final db = FirebaseFirestore.instance;

  Map<String, dynamic> food = {
    'Apple': 'Banana',
    'Strawberry': 'Blueberry',
  };
  @override
  Widget build(BuildContext context) {
    String text = '';
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  db
                      .collection('foods')
                      .doc()
                      .set(food)
                      .onError(
                        (error, stackTrace) => print(error),
                      )
                      .then(
                        (value) => setState(() {
                          text = 'done';
                        }),
                      );
                },
                child: const Text('Add the set'),
              ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
