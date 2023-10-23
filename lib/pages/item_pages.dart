import 'package:belanja/models/items.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});
  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                itemArgs.name.toString(),
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 6),
              const Text(
                'with',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(width: 6),
              Text(
                itemArgs.price.toString(),
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
