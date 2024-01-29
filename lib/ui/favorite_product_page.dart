import 'package:flutter/material.dart';
import 'package:project_flutter/data/product_data.dart';

class FavoriteProductPage extends StatelessWidget {
  const FavoriteProductPage({
    super.key,
    required this.likedProductIds,
  });

  final List<int> likedProductIds;

  @override
  Widget build(BuildContext context) {
    final likedProduct = products
        .where(
          (product) => likedProductIds.contains(product.id),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title:const Text('Favorit Products'),
      ),
      body: ListView.separated(
        itemCount: likedProduct.length,
        separatorBuilder: (_,__) => const SizedBox(height: 12),
        padding: const EdgeInsets.all(20),
        itemBuilder: (context,index){
          final product = likedProduct[index];


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
