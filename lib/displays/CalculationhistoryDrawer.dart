import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/CalculatorProvider.dart';
import 'package:provider/provider.dart';

class HistoryDrawer extends StatelessWidget {
  const HistoryDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final history = context.watch<Counter>().history;

    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Text(
              'Calculation History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    history[index],
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                context.read<Counter>().clearHistory();
              },
              child: const Text("Clear History"),
            ),
          ),
        ],
      ),
    );
  }
}
