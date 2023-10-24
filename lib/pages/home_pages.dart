import 'package:belanja/models/items.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(
      name: 'Sugar',
      image: 'assets/sugar.jpg',
      price: 5000,
      stock: 50,
      rating: 4.5,
    ),
    Item(
      name: 'Salt',
      image: 'assets/salt.jpg',
      price: 2000,
      stock: 50,
      rating: 4.6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toko Item"),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: GridView.count(
          primary: false,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: items
              .asMap()
              .entries
              .map((item) => ItemCard(
                    item: item.value,
                    index: item.key,
                  ))
              .toList(),
        ),
      ),
      bottomNavigationBar: const Text(
        "Ahmad Fathan Aqil Faiq/2141720172",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black54, fontSize: 12),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Item item;
  final int index;
  const ItemCard({super.key, required this.item, required this.index});

  final String routeName = '/item';
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName, arguments: (item, index));
        },
        child: Card(
          child: SizedBox(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Hero(
                      tag: "imageMovePage_$index",
                      child: Image(
                        image: NetworkImage(
                          item.image.toString(),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(item.name.toString()),
                Text(item.price.toString()),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(item.rating.toString())
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
