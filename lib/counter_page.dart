import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_example/services/firebase_service.dart';
import 'package:flutter_mobx_example/store/counter/counter.dart';

class CounterPage extends StatelessWidget {
  CounterPage({Key? key}) : super(key: key);

  final Counter counter = Counter();
  final FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter mobx examples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: firebaseService.getUserName(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!['first']);
                } else {
                  return const Text('');
                }
              },
            ),

            const Text('counter'),
            Observer(builder: (_) => Text('${counter.count}')),
            // ++
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: counter.increment, child: const Text('Add'))
            ]),

            // --
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: counter.decrement, child: const Text('Minus'))
            ])
          ],
        ),
      ),
    );
  }
}
