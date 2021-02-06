// THIS IS A SAMPLE FILE. Get the full content at the link above.

import 'product.dart';

class ProductsRepository {
  static const _allProducts = <Product>[
    Product(
      category: Category.accessories,
      id: 0,
      isFeatured: true,
      name: 'Vagabond sack',
      price: 120,
    ),
    Product(
      category: Category.home,
      id: 9,
      isFeatured: true,
      name: 'Gilt desk trio',
      price: 58,
    ),
    Product(
      category: Category.clothing,
      id: 33,
      isFeatured: true,
      name: 'Cerise scallop tee',
      price: 42,
    ),
    // THIS IS A SAMPLE FILE. Get the full content at the link above.
  ];

  static List<Product> loadProducts(Category category) {
    if (category == Category.all) {
      return _allProducts;
    } else {
      return _allProducts.where((p) => p.category == category).toList();
    }
  }
}
