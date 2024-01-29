import 'package:flutter/material.dart';
import 'package:project_flutter/data/product_data.dart';
import 'package:project_flutter/ui/favorite_product_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<int> likedProductIds = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteProductPage(
                      likedProductIds: likedProductIds,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: ListView.separated(
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          final product = products[index];
          final isProductLiked = likedProductIds.contains(product.id);

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), //letak bayangan
                ),
              ],
            ),
            clipBehavior: Clip.hardEdge,
            //radius of image atau mengikuti Radius.circular BoxDecoration
            child: Row(
              children: [
                Image.network(
                  product.imageUrl,
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Rp${product.price}",
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (isProductLiked) {
                                  likedProductIds.remove(product.id);
                                } else {
                                  likedProductIds.add(product.id);
                                }
                              });
                            },
                            icon: Icon(
                              isProductLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isProductLiked ? Colors.red : Colors.black,
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
