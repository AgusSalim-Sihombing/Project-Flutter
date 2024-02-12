import 'package:flutter/material.dart';
import 'package:project_flutter/data/product_data.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
        ],
      ),
      body: ListView.separated(
        itemCount: products.length,
        separatorBuilder: (_, __) =>
        const SizedBox(
          height: 12,
        ),
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          // final product = products[index];

          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5)
                )
              ]
            ),
          );
        },
      ),
    );
  }
}
