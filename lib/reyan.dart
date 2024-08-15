import 'package:flutter/material.dart';

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.visibility_off, color: Colors.black),
          ),
          SearchBar(),
          PreviousSearches(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Results',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Expanded(child: ProductList())
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        /* boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3))
        ],*/
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey[600]),
          Expanded(
              child: TextField(
                  decoration: InputDecoration(border: InputBorder.none))),
          Icon(Icons.cancel, color: Colors.grey[600]),
        ],
      ),
    );
  }
}

class PreviousSearches extends StatelessWidget {
  final List<String> searches = [
    'Visual identiy',
    'Panting',
    'Coding',
    'writing'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14, right: 8),
      child: Wrap(
        spacing: 6,
        children: searches
            .map((s) => Chip(
                  label: Text(s),
                  backgroundColor: Colors.grey[200],
                  side: BorderSide(width: 0, color: Colors.transparent),
                ))
            .toList(),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'Product Design v1.0',
      'owner': 'Roboston connie',
      'imagePath': 'assets/product1.png',
      'price': '\$150',
      'timeAgo': '16 hours ago'
    },
    {
      'name': 'Product Design',
      'owner': 'Webb Lodon',
      'imagePath': 'assets/product2.png',
      'price': '\$250',
      'timeAgo': '14 hours ago'
    },
    {
      'name': 'Product Design',
      'owner': 'Webb kyle',
      'imagePath': 'assets/product3.png',
      'price': '\$250',
      'timeAgo': '14 hours ago'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: products.map((p) => ProductItem(product: p)).toList(),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Map<String, String> product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3))
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product['name']!,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Icon(Icons.umbrella, color: Colors.grey[600], size: 16),
                    SizedBox(width: 4),
                    Text('By ${product['owner']}',
                        style:
                            TextStyle(fontSize: 16, color: Colors.grey[600])),
                  ],
                ),
                Row(
                  children: [
                    Text(product['price']!,
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 11, 34, 136),
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      // color: Colors.pink[50],
                      padding: EdgeInsets.only(left: 2, right: 2),
                      width: 90,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.pink[50],
                      ),
                      child: Text(product['timeAgo']!,
                          style: TextStyle(
                              fontSize: 14, color: Colors.deepOrange)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
